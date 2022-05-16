pipeline {
    agent any
	tools
    {
       maven "MAVEN"
    }
	
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'main', url: 'https://github.com/malisambhaji24/java-spring-boot-maven.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t java-spring-boot .' 
                sh 'docker tag new sambhaji24/java-spring-boot'
                               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) 
          sh  'docker push sambhaji24/java-spring-boot'
       
        }
                  
          }
        }
     
      
	}
