node {
	stage('Docker'){
		
			checkout scm
			def mavenImage = docker.image('simple-app:develop')

			mavenImage.build("-u root")
		

    }
    stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
}

