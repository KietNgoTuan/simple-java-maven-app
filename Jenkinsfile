node {
	stage('Docker'){
		ws('/var/jenkins_home/workspace/nodeDockerCustomWorkspace'){
			checkout scm
			def mavenImage = docker.image('maven:3.8.1-adoptopenjdk-11')

			mavenImage.inside("-u root"){ 

				stage('Build'){
				    sh 'mvn -v'
				}
				stage('Test') {
				    try{
					sh 'mvn test' 
				    }
				    catch(err){}
				    finally{
					junit 'target/surefire-reports/*.xml'
				    }

				}
			}
		}

    }
    stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
            }
        }
}

