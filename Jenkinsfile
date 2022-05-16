pipeline {
    agent any
	def app
    tools {
        maven 'MAVEN'
        dockerTool 'docker'
    }
    stages{
       
        stage('BUILD'){
            when {
                branch 'release/*'
            }
            steps{
                echo "BUILDING THE IMAGE... "
                
                sh "mvn clean package"
	    }
	}
	  
	 stage('Build image') {
		 steps{
			 app = docker.build("sambhaji24/kiran")
		 }
    }

    stage('Push image') {
	    steps{
		    docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') 
		    app.push("${env.BUILD_NUMBER}")
		    app.push("latest")
	    }
    }
	    
        }
    }
	
