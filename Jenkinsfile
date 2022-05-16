pipeline {
    agent any
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
    }
}
