pipeline 
{
    agent any
   
    stages
    {
        stage ('Initialize the Maven')
        {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                    M2_HOME='/opt/apache-maven-3.6.3'
					PATH="$M2_HOME/bin:$PATH"
					export PATH
                ''' 
            }
        }
        stage ('Build the maven project with testing parameter') 
        {
            steps 
            {
                //env.environment
                //env.module
                //env.exeType
                //env.
                sh 'mvn clean test' 
            }
            post 
            {
                success 
                {
                 	archiveArtifacts artifacts:'target/karate-reports/karate-summary.html', fingerprint: true
                    junit 'target/surefire-reports/**/*.xml' 
                    junit 'target/karate-reports/karate-summary.html'
                    echo 'Successfully!'
                }
                
		        failure {
		        
		            echo 'Failed!'
		        }
		        unstable {
		            echo 'This will run only if the run was marked as unstable'
		        }
		        changed {
		            echo 'This will run only if the state of the Pipeline has changed'
		            echo 'For example, if the Pipeline was previously failing but is now successful'
		        }
                
            }
            
            
            
        }
        
    }
}
