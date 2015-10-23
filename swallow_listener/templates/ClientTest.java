package {{ project_package }}.mq.client;

import {{ project_package }}.api.dtos.{{ mq_message_dto }};
import com.dianping.swallow.common.internal.message.SwallowMessage;
import com.dianping.swallow.consumer.BackoutMessageException;
import com.dianping.swallow.producer.Producer;
import org.junit.Before;
import org.junit.Test;

import static org.mockito.Matchers.any;
import static org.mockito.Mockito.doThrow;
import static org.mockito.Mockito.mock;

import junit.framework.Assert;
import org.apache.commons.collections.CollectionUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;
import java.util.List;
import java.util.Date;
import java.math.BigDecimal;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/config/spring/common/appcontext-*.xml",
        "classpath*:/config/spring/local/appcontext-*.xml"})

public class {{ topic_name }}ClientTest {

    @Autowired
    private Producer {{ topic_name|lower0 }}Client;

    @Test
    public void testSendMessage() throws Exception {
        {{ mq_message_dto }} {{ mq_message_dto|lower0 }} = new {{ mq_message_dto }}();

        {{ topic_name|lower0 }}Client.sendMessage({{ mq_message_dto|lower0 }});
    }
}
