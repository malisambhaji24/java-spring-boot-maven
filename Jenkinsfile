pipeline {
    agent any
	tools
    {
       maven "MAVEN"
    }
	
 stages {
      stage('checkout') {
           steps {
             
                git branch: 'master', url: 'https://github.com/malisambhaji24/java-spring-boot-maven.git'
             
          }
        }
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:Sample .' 
                sh 'docker tag samplewebapp malisambhaji24/java-spring-boot'
                               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "docker-hub-credentials", url: "" ]) {
          sh  'docker push malisambhaji24/java-spring-boot
       
        }
                  
          }
        }
     
      //age('Run Docker container on Jenkins Agent') {
             
            //eps 
			{
                sh "docker run -d -p 8003:80 malisambhaji24/java-spring-boot
 
            }
        }
 //age('Run Docker container on remote hosts') {
             
            //eps {
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 malisambhaji24/samplewebapp"
 
            }
        }
    }
	}
