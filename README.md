# Shree Shanta Synfab LLP - Textile Firm Web Platform

Welcome to Shree Shanta Synfab LLP, the digital gateway to a textile firm in Bhilwara. This platform is designed to streamline textile management, reporting, and fabric inquiries. As the developer behind this project, I'll take you through the technologies, unique features, and challenges I encountered during its development.

![Shree Shanta Synfab LLP Logo](https://shreeshantasynfabllp.databoltahai.in/Content/assets/Images/About/SHREE%20SHANTA%20SYNFAB.png)

## Table of Contents
- [Introduction](#introduction)
- [Key Technologies](#key-technologies)
- [Unique Features](#unique-features)
- [Challenges Faced](#challenges-faced)
- [Automated ATS Reports](#automated-ats-reports)
- [Fabric Management](#fabric-management)
- [Weaving and Enquiries](#weaving-and-enquiries)
- [Page Visit Tracking](#page-visit-tracking)
- [Getting Started](#getting-started)
- [Live Demo](#live-demo)
- [Contributing](#contributing)
- [License](#license)

## Introduction

I'm the developer behind Shree Shanta Synfab LLP, a textile firm's digital transformation journey. This platform aims to enhance textile management, reporting, and fabric inquiries, providing an efficient and automated solution.

![Shree Shanta Synfab LLP Logo](https://shreeshantasynfabllp.databoltahai.in/Content/assets/Images/About/SHREE%20SHANTA%20SYNFAB.png)

## Key Technologies

The technology stack powering Shree Shanta Synfab LLP includes:

- **ASP.NET MVC 5**: The foundational framework for building the web platform.
- **Entity Framework 4.8 and Entity Framework 6 (EF6)**: Object-Relational Mapping (ORM) tools for efficient database operations.
- **EPPlus**: A powerful spreadsheet library for .NET used for Excel-related functionalities.
- **Twilio REST API helper library**: For communication and notifications (Used untill it was giving free services).
- **OfficeOpenXml**: A library for reading and manipulating Excel files.
- **JavaScript and jQuery**: For dynamic client-side interactions.
- **Ajax**: Enabling seamless asynchronous data exchange.
- **HTML5 and CSS3**: The latest web standards for enhanced structure and styling.
- **Bootstrap 5 (BS5)**: A front-end framework for creating responsive and mobile-friendly user interfaces.

### Page Visit Tracking

To ensure you have a complete picture of your web platform's performance, I've implemented a Page Visit Tracking system:

- **Visitor Identification**: We track unique views of the website by identifying visitors through their IP addresses.
- **Cookie Management**: We check if the visitor identifier cookie exists for returning visitors and generate a new visitor identifier if necessary.
- **Cookie Storage**: A new cookie is created to store the visitor identifier, ensuring a personalized experience.
- **Page Visit Records**: We record each page visit along with the associated visitor identifier, providing insights into user engagement.

## Unique Features

### Automated ATS Reports

One of the standout features is the automated ATS (Auto Tensioning System) reports generation. The textile firm generates daily ATS reports for loomwise and partywise production data of weaving. To present these reports to clients in the account section after login, I implemented a robust system. 

- Uploaded client report Excel files through Dropbox are scanned and selected from a specific path.
- A unique challenge was that client reports lacked an ID or client ID, only containing the firm name.
- To overcome this, I developed a system where clients create accounts and provide their firm names at signup.
- Using EPPlus and OfficeOpenXml, I extracted the party name from the client report Excel file.
- I then validated it against the logged-in user's party name, generating an Excel report with the logged-in party's records from the database.

### Fabric Management

The platform allows Shree Shanta Synfab LLP to add fabrics and weaving details with available color options. This feature streamlines product management and enhances the user experience.

## Challenges Faced

Developing the automated ATS reports feature presented several challenges:

- Handling Excel files with no ID or client ID, relying solely on firm names.
- Ensuring data consistency and accuracy while integrating new client reports with existing database records.
- Creating a seamless process for the admin to update records and generate updated client reports with a single button click.

## Weaving and Enquiries

The platform also supports specific weaving or fabric inquiries, simplifying the process of inquiring about fabrics.

## Getting Started

To explore Shree Shanta Synfab LLP:

1. Clone this repository to your local machine.
2. Open the project in Visual Studio.
3. Configure the database connection in the Web.config file to match your SQL Server setup.
4. Use Entity Framework migrations to create the necessary database tables.
5. Build and run the application.

## Live Demo

Experience Shree Shanta Synfab LLP live at [https://shreeshantasynfabllp.databoltahai.in/](https://shreeshantasynfabllp.databoltahai.in/). Witness the textile firm's digital transformation in action!

## Contributing

Contributions to Shree Shanta Synfab LLP are welcome! If you'd like to contribute to this project or collaborate on textile and automation solutions, please reach out. Together, we can revolutionize textile management!

## License

This project is licensed under the [MIT License](LICENSE).

---

Created with ❤️ by [CoderOm]
