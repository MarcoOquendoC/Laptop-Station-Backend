<a name="readme-top"></a>

<div align="center">
  <!-- You are encouraged to replace this logo with your own! Otherwise you can also remove it. -->

  <br/>

  <h3><b>Laptop Station Backend</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
  - [👷🏼 Frontend link](#frontend)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Laptop Station Backend <a name="about-project"></a>

**Laptop Station Backend** holds the BackEnd development source rails api of the Laptop Station app which is a "Book an Appointment" type app.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://www.ruby-lang.org/">Ruby</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Rails</a></li>
  </ul>
</details>

<details>
  <summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<details>
  <summary>Entity Relationship Diagram (ERD)</summary>
  <ul>
    <br />
    <li>
      <img src="https://user-images.githubusercontent.com/104022866/224164928-6c05f0ab-c29d-48a3-871b-f845007df931.png" alt="ERB Diagram" />
    </li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **[Devise authentication to access Reservations]**
- **[JWT Authorization upon login and register]**
- **[Rspec Unit testing]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link](https://github.com/MarcoOquendoC/Laptop-Station-Backend)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LINK TO FRONTEND -->

## 🚀 Link to Frontend <a name="frontend"></a>

- [Laptop-Station-Frontend](https://github.com/MarcoOquendoC/Laptop-Station-Frontend)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

In order to work on this project, you need to have the following dependencies installed:

<ul>
  <li><a href="https://www.ruby-lang.org/en/">Ruby</a></li>
  <li><a href="https://www.postgresql.org/">Postgresql</a></li>
  <li><a href="https://nodejs.org/en/">Node.js</a></li>
  <li><a href="https://rubyonrails.org/">Rails</a></li>
</ul>

### Setup

- Clone the projects
- In the backend. Create a file called `.env` in your root directory with the following content:

```sh
  DB_USERNAME = postgres
  DB_HOST = localhost
  DB_PASSWORD = HERE-GOES-YOUR-PG-ADMIN-PASSWORD
  DB_PORT = 5432
  
  SECRET_KEY_BASE = fc5fba45f7f2d5de9fcfee8a6b35bdfeaf296661c69d05ed73a71347c447e5d46c2785d581c5f241fee3467a9b73ca784d085727abfe68d9a81b5b9441f08cf9
```

- The file database.yml is already configured to use those variables, you could check in Linux terminal the postgres databases using `sudo -i -u postgres` then `psql`.

### Install

Install this project with:

```sh
  cd my-project
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```

### Run tests

To run tests, run the following command:

```sh
  rspec
  rake rswag
```

### Deployment

You can deploy this project in the browser opening the page:

```
  localhost:3001
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

> Mention all of the collaborators of this project.

<img src="https://ca.slack-edge.com/T47CT8XPG-U03F05G9G2U-00b118c6fbce-512" alt="Josue" width="40" height="40" /> **Josué Benavides**

- GitHub: [@jdbs9514](https://github.com/jdbs9514)
- Twitter: [@JODA1015](https://twitter.com/JODA1015)
- LinkedIn: [Josué](https://linkedin.com/in/macoin)

<img src="https://ca.slack-edge.com/T47CT8XPG-U03GYGT3LBA-0bd15eb5c4a7-512" alt="Marco" width="40" height="40" /> **Marco Oquendo**

- GitHub: [@MarcoOquendoC](https://github.com/MarcoOquendoC). 
- Twitter: [@marcooquendoc](https://twitter.com/marcooquendoc). 
- LinkedIn: [Marco Vinicio Oquendo](https://www.linkedin.com/in/MarcoOquendoC/).

<img src="https://ca.slack-edge.com/T47CT8XPG-U03S4GS3656-48153a564fda-512" alt="Marcos" width="40" height="40" /> **Marcos Gualtero Lourenzo**

- GitHub: [@Goruchie](https://github.com/Goruchie)
- Twitter: [@twitterhandle](https://twitter.com/goruchie2)
- LinkedIn: [LinkedIn](https://linkedin.com/in/marcosgualtero)

<img src="https://ca.slack-edge.com/T47CT8XPG-U03RC6N92VB-af5eab93ad1a-512" alt="Mauricio" width="40" height="40" /> **Mauricio Mendoza**

- GitHub: [@rbreva](https://github.com/rbreva)
- Twitter: [@rbreva75](https://twitter.com/rbreva75)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/r-mauricio-mendoza-huerta/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> Describe 1 - 3 features you will add to the project.

- [ ] **[Confirmation after sign up]**
- [ ] **[Deploy using Render]**
- [ ] **[Admin Access]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/MarcoOquendoC/Laptop-Station-Backend/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project please give us a Star

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank:
- [Microverse](https://www.microverse.org/)
- Code Reviewers

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
