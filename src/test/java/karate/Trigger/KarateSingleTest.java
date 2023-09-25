package karate.Trigger;


import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.core.Result;
import com.intuit.karate.junit5.Karate;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Tags;
import org.springframework.boot.test.context.SpringBootTest;

@KarateOptions(tags = {"@smoke"})
public class KarateSingleTest 
{

    @Karate.Test
    
    //@Tags("@core")
    void parallelTest() 
    {
    	Results result=Runner.path("classpath:karate/hello/hello1.feature").parallel(5);
    	assertEquals(0,result.getErrors(),result.getErrorMessages());   
    }
    
    
}