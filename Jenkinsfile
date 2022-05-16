node {
    def app
	def mvnHome
	stage('Preparation') {
        git 'https://github.com/malisambhaji24/java-spring-boot-maven.git'
             mvnHome = tool 'M3'
    }
    stage('Build') {
        
        withEnv(["MVN_HOME=$mvnHome"]) {
            if (isUnix()) {
                sh '"$MVN_HOME/bin/mvn" -Dmaven.test.failure.ignore clean package'
            } else {
                bat(/"%MVN_HOME%\bin\mvn" -Dmaven.test.failure.ignore clean package/)
            }
        }
    }
        stage('BUILD'){
            echo "BUILDING THE IMAGE... "                
                sh "mvn clean package"
	}

    stage('Clone repository') {
        checkout scm
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
