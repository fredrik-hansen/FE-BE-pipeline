package compliance

# Define violations for compliance checks
violations[msg] {
    # Check for hardcoded secrets
    input.files[_].content =~ "password.*=.*['\"][^'\"]{8,}['\"]"
    msg := "Hardcoded password detected"
}

violations[msg] {
    # Check for hardcoded API keys
    input.files[_].content =~ "api_key.*=.*['\"][^'\"]{20,}['\"]"
    msg := "Hardcoded API key detected"
}

violations[msg] {
    # Check for hardcoded database credentials
    input.files[_].content =~ "DATABASE_URL.*=.*['\"][^'\"]{10,}['\"]"
    msg := "Hardcoded database URL detected"
}

violations[msg] {
    # Check for insecure HTTP URLs
    input.files[_].content =~ "http://[^s]"
    msg := "Insecure HTTP URL detected"
}

violations[msg] {
    # Check for deprecated dependencies
    input.dependencies[_].name = "lodash"
    input.dependencies[_].version =~ "^[0-3]\\."
    msg := "Deprecated lodash version detected"
}

# Security policy violations
security_violations[msg] {
    # Check for SQL injection vulnerabilities
    input.files[_].content =~ "execute.*\\+.*input"
    msg := "Potential SQL injection vulnerability"
}

security_violations[msg] {
    # Check for XSS vulnerabilities
    input.files[_].content =~ "innerHTML.*=.*input"
    msg := "Potential XSS vulnerability"
}

# License compliance
license_violations[msg] {
    # Check for GPL dependencies in commercial projects
    input.dependencies[_].license = "GPL"
    msg := "GPL license detected - review for compliance"
} 