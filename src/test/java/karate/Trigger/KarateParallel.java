package karate.Trigger;


import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;


//import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;


public class KarateParallel 
{

    @Test
    @Tag("parallel")
    @Tag("core")
    @Tag("currentRun")
    void KarateParallelMethod() 
    {
       // return Karate.run("classpath:karate/hello/helloworld.feature");
    	
    	//Results result=Runner.path("classpath:karate/APIAutomation/masterFeatures.feature").tags("@currentRun").parallel(5);
    	//Results result=Runner.path("classpath:karate/APIAutomation/soap.feature").tags("@currentRun").parallel(5);
    	//All Karate test
    	//Results result=Runner.path("classpath:karate/APIAutomation").tags("@currentRun").parallel(5);
    	//Results result=Runner.path("classpath:karate/APIAutomation/*.feature").parallel(5);
    	
    	//Specific
    	Results result=Runner.path("classpath:karate/APIAutomation/myBioSitePerformanceCheck.feature").parallel(5);
    	//Results result=Runner.path("classpath:karate/APIAutomation/masterFeatures.feature").tags("@mani").parallel(5);
    	
    	//assertEquals(0,result.getErrors(),result.getErrorMessages());
	   
    }
    
}