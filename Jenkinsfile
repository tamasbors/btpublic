def gv

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
        NEW_VERSION = '2.9.0'
    }
    parameters {
        string(name: 'TOAS', defaultValue: 'norbi', description: 'versdion to deploy on prod')
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }
    stages {
        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("build") {
            when {
                expression {
                    BRANCH_NAME == 'first_branch'
                }
            }
            steps {
                script {
                    gv.buildApp()
                }
                echo "building the application ${params.TOAS}..."
                echo "building version ${NEW_VERSION}"
                sh '''
                cd myapp
                pip install -r requirements.txt
                '''
            }
        }
        stage("test") {
            when {
                expression {
                    params.executeTests == true
                }
            }
            steps {
                script {
                    gv.testdApp()
                }
                echo "testing the application..."
                sh '''
                cd myapp
                python3 hello.py
                python3 hello.py --name=Brad
                '''
            }
        }
        stage("deploy") {
            when {
                expression {
                    BRANCH_NAME == 'main' || BRANCH_NAME == 'first_branch'
                }
            }
            steps {
                script {
                    gv.deployApp()
                }
                echo 'deploying the applicaiton...'
                echo 'deployin vresion ${params.VERSION}'
                sh '''
                cd myapp
                python3 hello.py --name=Tamas
                sleep 10
                '''
            }
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
            echo "runs on success"
            '''
        }
        failure {
            sh '''
            echo "runs on failure"
            '''
        }
    }
}
