node {
	stage('Docker'){
		ws('/var/jenkins_home/workspace/nodeDockerCustomWorkspace'){
			checkout scm
			def mavenImage = docker.image('maven:3.8.1-adoptopenjdk-11')

			mavenImage.inside("-u root -v /root/.m2:/root/.m2"){ 

				stage('Build'){
				    sh 'mvn -B -DskipTests clean package'
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

