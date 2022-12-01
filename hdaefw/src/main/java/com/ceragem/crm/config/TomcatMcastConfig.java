package com.ceragem.crm.config;

import org.apache.catalina.Context;
import org.apache.catalina.Engine;
import org.apache.catalina.ha.session.ClusterSessionListener;
import org.apache.catalina.ha.session.DeltaManager;
import org.apache.catalina.ha.session.JvmRouteBinderValve;
import org.apache.catalina.ha.tcp.ReplicationValve;
import org.apache.catalina.ha.tcp.SimpleTcpCluster;
import org.apache.catalina.tribes.group.GroupChannel;
import org.apache.catalina.tribes.group.interceptors.DomainFilterInterceptor;
import org.apache.catalina.tribes.group.interceptors.MessageDispatchInterceptor;
import org.apache.catalina.tribes.group.interceptors.TcpFailureDetector;
import org.apache.catalina.tribes.group.interceptors.TcpPingInterceptor;
import org.apache.catalina.tribes.membership.McastService;
import org.apache.catalina.tribes.transport.ReplicationTransmitter;
import org.apache.catalina.tribes.transport.nio.NioReceiver;
import org.apache.catalina.tribes.transport.nio.PooledParallelSender;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.embedded.tomcat.TomcatContextCustomizer;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Configuration;

//@Configuration
public class TomcatMcastConfig implements WebServerFactoryCustomizer<TomcatServletWebServerFactory> {

	static final String SESSION_CLUSTER_DOMAIN = "crm-cluster";

	@Value("${spring.mcast.host}")
	String host;

	@Value("${spring.mcast.service-port}")
	int servicePort;

	@Value("${spring.mcast.receiver-port}")
	int receiverPort;

	class TomcatClusterContextCustomizer implements TomcatContextCustomizer {
		@Override
		public void customize(final Context context) {
			context.setDistributable(true);
			DeltaManager manager = new DeltaManager();
			manager.setExpireSessionsOnShutdown(false);
			manager.setNotifyListenersOnReplication(true);
			context.setManager(manager);
			configureCluster((Engine) context.getParent().getParent());
		}

		private void configureCluster(Engine engine) {
			SimpleTcpCluster cluster = new SimpleTcpCluster();
			cluster.setChannelSendOptions(6);
			GroupChannel channel = new GroupChannel();
			McastService mcastService = new McastService();
			mcastService.setAddress(host);
			mcastService.setPort(servicePort);
			mcastService.setFrequency(500);
			mcastService.setDropTime(3000);
			mcastService.setDomain(SESSION_CLUSTER_DOMAIN);
			channel.setMembershipService(mcastService);
			NioReceiver receiver = new NioReceiver();
			receiver.setAddress("auto");
			receiver.setMaxThreads(6);
			receiver.setPort(receiverPort);
			channel.setChannelReceiver(receiver);
			ReplicationTransmitter sender = new ReplicationTransmitter();
			sender.setTransport(new PooledParallelSender());
			channel.setChannelSender(sender);
			channel.addInterceptor(new TcpPingInterceptor());
			channel.addInterceptor(new TcpFailureDetector());
			channel.addInterceptor(new MessageDispatchInterceptor());
			DomainFilterInterceptor domainFilterInterceptor = new DomainFilterInterceptor();
			domainFilterInterceptor.setDomain(SESSION_CLUSTER_DOMAIN);
			channel.addInterceptor(domainFilterInterceptor);
			cluster.addValve(new ReplicationValve());
			cluster.addValve(new JvmRouteBinderValve());
			cluster.setChannel(channel);
			cluster.addClusterListener(new ClusterSessionListener());
			engine.setCluster(cluster);
		}
	}

	@Override
	public void customize(TomcatServletWebServerFactory factory) {
		factory.addContextCustomizers(new TomcatClusterContextCustomizer());

	}

}
