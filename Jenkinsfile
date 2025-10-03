pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                echo 'Building'
                bat '''
                    "C:\\Users\\91956\\AppData\\Local\\Programs\\Python\\Python313\\python.exe" -m venv sauce
                    call sauce/Scripts/activate
                    pip install -r requirements.txt
                    robot tests/test_invalid_credentials.robot 
                '''
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Testing'
                bat '''
                    call sauce/Scripts/activate
                    robot tests/test_invalid_credentials.robot
                '''
            }
        }
    }

   post {
        success {
            step([
                $class: 'GitHubCommitStatusSetter',
                contextSource: [$class: 'ManuallyEnteredCommitContextSource', context: 'CI Build'],
                statusResultSource: [$class: 'ConditionalStatusResultSource', 
                    results: [[
                        $class: 'AnyBuildResult',
                        message: 'Pipeline Build Success',
                        state: 'SUCCESS'
                    ]]
                ]
            ])
        }
        failure {
            step([
                $class: 'GitHubCommitStatusSetter',
                contextSource: [$class: 'ManuallyEnteredCommitContextSource', context: 'CI Build'],
                statusResultSource: [$class: 'ConditionalStatusResultSource', 
                    results: [[
                        $class: 'AnyBuildResult',
                        message: 'Pipeline Build Failed',
                        state: 'FAILURE'
                    ]]
                ]
            ])
        }
    }
}
















