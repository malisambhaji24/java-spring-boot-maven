node {
    def app
	       
        stage('BUILD'){
            echo "BUILDING THE IMAGE... "                
                sh "mvn clean package"
	}

    stage('Clone repository') {
        checkout scm
    }

    stage('Build image') {
        app = docker.build("sambhaji24/techverito")
    }

    stage('Push image') {
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
