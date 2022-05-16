node {
    def app
  tools {
       maven 'MAVEN'
  }
    stage('Clone repository') {
        checkout scm
        sh "mvn -Dmaven.test.failure.ignore=true clean package"
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
