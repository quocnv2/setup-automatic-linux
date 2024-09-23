
# Automatic Development Environment Setup for Linux

This project offers an automated script to set up a full development environment on Ubuntu-based systems, installing essential tools and software, and managing dependencies, making it ideal for developers to quickly and easily configure their workspace.

## Table of Contents

- [Installation](#installation)
- [Tools and Software Included](#tools-and-software-included)
- [Usage](#usage)
- [Troubleshooting](#troubleshooting)
- [License](#license)
- [Contact](#contact)

## Installation

Follow these steps to set up the development environment on your system:

```bash
# Clone the repository
git clone https://github.com/quocnv2/setup-automatic-linux.git

# Navigate into the project directory
cd setup-automatic-linux

# Grant execution permission for the script
chmod +x setup.sh

# Run the script
./setup.sh
```

## Tools and Software Included

The setup script will install and configure the following tools and software:

### System Utilities
- `build-essential`: Compilation tools like `gcc` and `make`.
- `curl`: Command-line tool for transferring data with URLs.
- `wget`: Utility for non-interactive download of files from the web.
- `git`: Version control system.
- `htop`: Interactive process viewer for Unix systems.
- `vim`: Advanced text editor.
- `tmux`: Terminal multiplexer.
- `zsh`: Shell designed for interactive use.

### Programming Languages & Package Managers
- **NVM (Node Version Manager):** To manage multiple Node.js versions.
- **Node.js (Latest LTS version):** JavaScript runtime environment.
- **Python 3 and pip:** Programming language and package manager.
- **OpenJDK 11:** Java Development Kit.

### Containers & Orchestration
- **Docker:** Containerization platform.
- **Docker Compose:** Tool for defining and running multi-container Docker applications.

### IDEs & Editors
- **Visual Studio Code:** Code editor optimized for building and debugging modern web and cloud applications.

### Browsers
- **Google Chrome Dev (Unstable Version):** For developers who need to test the latest features and updates.

### Database Tools
- **MySQL:** Relational database management system.
- **PostgreSQL:** Advanced open-source relational database.
- **Redis:** In-memory data structure store.

### Communication & Productivity Tools
- **Postman:** API testing tool.
- **Slack:** Communication and collaboration platform.
- **Spotify:** Music streaming service.

### Cloud & Deployment Tools
- **Heroku CLI:** Command line interface for managing Heroku apps.
- **AWS CLI:** Command line interface for interacting with AWS services.

### Shell Customization
- **Oh My Zsh:** Framework for managing Zsh configuration.

## Usage

After running the script, your development environment will be fully configured. You can start using the installed tools and software immediately. To ensure all changes take effect, restart your terminal or log out and log back in again.

## Troubleshooting

- **Docker requires sudo to run:**
  If Docker commands still require `sudo` after running the script, try logging out and logging back in or restarting your computer to refresh group memberships.
  
- **Node.js not recognized:**
  Make sure NVM is loaded correctly by adding the following lines to your `.bashrc` or `.zshrc`:
  ```bash
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  ```

- **Permission denied errors:**
  Ensure you have the necessary permissions to execute the script. Run `chmod +x setup.sh` and try again.

- **Issues with package installations:**
  Make sure your system is up-to-date before running the script. Use `sudo apt-get update -y && sudo apt-get upgrade -y`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For any questions or support, feel free to reach out:

- **Nguyen Van Quoc** - [quoc.nguyenvan2000@gmail.com](mailto:quoc.nguyenvan2000@gmail.com)
- **Project Repository:** [https://github.com/quocnv2/setup-automatic-linux](https://github.com/quocnv2/setup-automatic-linux)