node {
    def app
	def mvnHome
	stage('Preparation') {
        checkout scm
             mvn = tool 'M3'
    }
    stage('Build') {
        
        sh "mvn clean package"
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
