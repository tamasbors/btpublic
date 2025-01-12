pipeline {
    agent { 
        node {
            label 'docker-agent-python'
            }
      }
    triggers {
        pollSCM '*/5 * * * *'
    }
    environment {
        NEW_VERSION = '1.3.0'
    }
    stages {
        stage("build") {
            when {
                expression {
                    BRANCH_NAME == 'first_branch' && CODE_CHANGES == true
                }
            }
            steps {
                echo "building the application..."
                echo "building version ${NEW_VERSION}"
                echo 'building version ${NEW_VERSION}'
                sh '''
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage("test") {
            when {
                expression {
                    BRANCH_NAME == 'main' || BRANCH_NAME == 'first_branch'
                }
            }
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
                cd myapp
                python3 hello.py --name=Tamas
                sleep 10
                '''
            }
        }
        post {
            always {
                sh '''
                echo "runs always"
                '''
            }
            success {
                sh '''
                echo "runs always"
                '''
            }
            failure {
                sh '''
                echo "runs always"
                '''
            }
        }
    }
}
