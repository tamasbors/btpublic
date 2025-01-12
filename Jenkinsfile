pipeline {
    agent { 
        node {
            label 'docker-agent-python'
            }
      }
    triggers {
        pollSCM '*/5 * * * *'
    }
    stages {
        stage("build") {
            steps {
                echo "building the application..."
                sh '''
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage("test") {
            steps {
                echo "testing the application..."
                sh '''
                cd myapp
                python3 hello.py
                python3 hello.py --name=Brad
                '''
            }
        }
        stage("deploy") {
            steps {
                echo 'deploying the applicaiton...'
                sh '''
                echo "doing delivery stuff.."
                '''
            }
        }
        post {
            always {
                //
            }
            success {
                //
            }
            failure {
                //
            }
        }
    }
}
