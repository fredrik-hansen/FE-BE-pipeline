# SonarQube Integration Setup

This project includes SonarQube Community Edition for static code analysis in the GitLab CI pipeline.

## Overview

SonarQube is integrated into the pipeline to provide:
- Code quality analysis
- Security vulnerability detection
- Code coverage reporting
- Technical debt tracking
- Code smell identification

## Pipeline Configuration

### Stages Added
- `sonarqube`: Runs after test and coverage stages

### Jobs Added
1. **build_sonarqube_scanner**: Builds a custom Docker image with SonarQube scanner
2. **sonarqube_backend**: Analyzes Python backend code
3. **sonarqube_frontend**: Analyzes JavaScript/TypeScript frontend code

## Configuration

### Environment Variables
The following variables are used in the pipeline:
- `SONAR_HOST_URL`: SonarQube server URL (default: http://sonarqube:9000)
- `SONAR_LOGIN`: SonarQube admin username (default: admin)
- `SONAR_PASSWORD`: SonarQube admin password (default: admin)

### Project Configuration
Each job creates a `sonar-project.properties` file with:
- Project key and name
- Source and test directories
- Coverage report paths
- SCM integration

## Setup Instructions

### 1. GitLab CI/CD Variables
Add the following variables in your GitLab project settings:
- `SONAR_HOST_URL`: Your SonarQube server URL
- `SONAR_LOGIN`: Your SonarQube username
- `SONAR_PASSWORD`: Your SonarQube password

### 2. SonarQube Server
You can either:
- Use the embedded SonarQube service (already configured)
- Set up a separate SonarQube instance and update the variables

### 3. Quality Gates
Configure quality gates in SonarQube to:
- Set coverage thresholds
- Define code quality rules
- Configure security rules

## Reports and Artifacts

The pipeline generates:
- `.scannerwork/` directories with analysis results
- Coverage reports (XML and HTML)
- Test execution reports

## Customization

### Adding Custom Rules
1. Create a `sonar-project.properties` file in your project root
2. Add custom rule configurations
3. The pipeline will use your custom configuration

### Quality Profiles
1. Create quality profiles in SonarQube
2. Assign them to your projects
3. Configure rule sets according to your standards

## Troubleshooting

### Common Issues
1. **SonarQube not ready**: The pipeline waits for SonarQube to be ready
2. **Coverage reports missing**: Ensure test jobs generate coverage reports
3. **Authentication issues**: Check SonarQube credentials in CI/CD variables

### Debug Mode
To enable debug logging, add to your `sonar-project.properties`:
```
sonar.verbose=true
```

## Best Practices

1. **Quality Gates**: Set up quality gates to fail builds on critical issues
2. **Regular Reviews**: Review SonarQube reports regularly
3. **Team Training**: Train team members on interpreting SonarQube reports
4. **Custom Rules**: Create project-specific rules when needed

## Security Considerations

- Never commit SonarQube credentials to the repository
- Use GitLab CI/CD variables for sensitive information
- Regularly update SonarQube and scanner versions
- Review security findings promptly

## Additional Resources

- [SonarQube Documentation](https://docs.sonarqube.org/)
- [SonarQube Scanner Documentation](https://docs.sonarqube.org/latest/analysis/scan/sonarscanner/)
- [GitLab CI/CD Variables](https://docs.gitlab.com/ee/ci/variables/) 