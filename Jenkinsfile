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











