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
                    call sauce/Scripts/activate.bat
                    pip install -r requirements.txt
                    robot tests/test_invalid_credentials.robot 
                '''
            }
        }

        stage('Run Tests') {
            steps {
                echo 'Testing'
                bat '''
                    call sauce/Scripts/activate.bat
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








