package karate.APIAutomation;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Tag;
import org.springframework.boot.test.context.SpringBootTest;


public class KarateParallel 
{

    @Karate.Test
    @Tag("parallel")
    @Tag("core")
    void KarateParallelMethod() 
    {
       // return Karate.run("classpath:karate/hello/helloworld.feature");
    	
    	Results result=Runner.path("classpath:karate/APIAutomation/differentMethods.feature").parallel(1);
    	//assertEquals(0,result.getErrors(),result.getErrorMessages());
	   
    }
    
}