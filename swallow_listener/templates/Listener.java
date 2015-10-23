package {{ project_package }}.mq.listener;

import com.dianping.avatar.log.AvatarLogger;
import com.dianping.avatar.log.AvatarLoggerFactory;
import {{ project_package }}.api.dtos.{{ mq_message_dto }};
import com.dianping.finance.common.aop.annotation.Log;
import com.dianping.finance.common.swallow.SwallowMessageListener;
import com.dianping.swallow.common.message.Message;
import com.dianping.swallow.consumer.BackoutMessageException;

/**
 * {{ author }}
 */
public class {{ topic_name }}Listener extends SwallowMessageListener {
    private static final AvatarLogger MONITOR_LOGGER = AvatarLoggerFactory.getLogger({{ topic_name }}Listener.class);

    @Log(logBefore = true, logAfter = true, severity = 1)
    @Override
    public void onMessage(Message message) throws BackoutMessageException {
        MONITOR_LOGGER.info(String.format("{{ topic_name }}Listener.onMessage, message=%s", message));
        try {
            {{ mq_message_dto }} {{ mq_message_dto|lower0 }} = message.transferContentToBean({{ mq_message_dto }}.class);
            handleMessage({{ mq_message_dto|lower0 }});
        } catch (Exception e) {
            MONITOR_LOGGER.error(String.format("severity=[2] {{ topic_name }}Listener.onMessage error, message=%s", message), e);
            throw new BackoutMessageException(e);
        }
    }

    private void handleMessage({{ mq_message_dto }} {{ mq_message_dto|lower0 }}){
        MONITOR_LOGGER.debug("begin to handle message");
        //TODO handle message

        MONITOR_LOGGER.debug("end to handle message");
    }
}
