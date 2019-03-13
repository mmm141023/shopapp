import com.fendou.utils.MailUtil;
import org.junit.Test;

import java.util.UUID;

public class TestMail {

    @Test
    public void m1(){
        String code = UUID.randomUUID().toString();
        MailUtil mailUtil = new MailUtil("487083721@qq.com",  code);
        mailUtil.run();
    }
}
