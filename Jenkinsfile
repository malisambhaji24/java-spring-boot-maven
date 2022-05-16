node {
    def app
	def mvnhome
	stage('Preparation') {
        checkout scm
             mvnhome = tool 'M3'
    }
    stage('Build') {
        
	    withEnv(["MVN_HOME=$mvnHome"]) {
            
                sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package'
	    }
    }
  
    stage('Build image') {
        app = docker.build("sambhaji24/kiran")
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
