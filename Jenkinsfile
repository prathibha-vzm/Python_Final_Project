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
                    python -m venv sauce
                    . sauce/bin/activate
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Testing'
                bat '''
                    . sauce/bin/activate
                    robot tests\test_invalid_credentials.robot
                '''
            }
        }
    }

    post {
        success {
            echo "All tests passed"
        }
        failure {
            echo "Some tests failed — check report in Jenkins"
        }
    }
}


