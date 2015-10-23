package {{ project_package }}.mq.listener;

import {{ project_package }}.api.dtos.{{ mq_message_dto }};
import com.dianping.swallow.common.internal.message.SwallowMessage;
import com.dianping.swallow.consumer.BackoutMessageException;
import org.junit.Before;
import org.junit.Test;

import static org.mockito.Matchers.any;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.mock;

public class {{ topic_name }}ListenerTest {

    private {{ topic_name }}Listener {{ topic_name }}ListenerStub;

    @Before
    public void setUp() throws Exception {
        {{ topic_name }}ListenerStub = new {{ topic_name }}Listener();
    }

    @Test
    public void testOnMessage() throws Exception {
        String content = "";
        SwallowMessage message = new SwallowMessage();
        message.setContent(content);
        {{ topic_name }}ListenerStub.onMessage(message);
    }

    @Test(expected = BackoutMessageException.class)
    public void testOnMessageException() throws Exception {
        String content = "";
        SwallowMessage message = new SwallowMessage();
        message.setContent(content);
        {{ topic_name }}ListenerStub.onMessage(message);
    }
}
