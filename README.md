# 🛍️ Smart Product Price Tracker

**Track prices. Discover trends. Shop smarter.**

Smart Product Price Tracker is a web application designed to help users monitor product prices across supported e-commerce websites, analyze historical price changes, and receive email notifications when prices drop.

Built with modern web technologies, the project combines a responsive interface, automated product data extraction, database-backed price tracking, and email notifications to make online shopping more informed and convenient.

## ✨ Key Features

- 🔍 **Product Price Tracking** — Add product URLs from supported e-commerce websites to monitor their prices.
- 📉 **Price History & Analytics** — View historical price changes through interactive charts.
- 🔔 **Price Drop Notifications** — Receive email alerts when tracked products become cheaper.
- 🔐 **Secure Authentication** — Sign in using Google authentication.
- ⚙️ **Automated Price Monitoring** — Scheduled jobs periodically check tracked product prices.
- 🌐 **Product Data Extraction** — Extract product information using Firecrawl.
- 🗄️ **Cloud Database** — Store product details and price history using Supabase and PostgreSQL.
- 📱 **Responsive Interface** — Access the application across supported desktop and mobile screen sizes.

## 🧰 Tech Stack

| Technology | Purpose |
|---|---|
| Next.js | Web application framework |
| React | Component-based user interface |
| Tailwind CSS | Styling and responsive layouts |
| shadcn/ui | Reusable UI components |
| Supabase | Backend services and database |
| PostgreSQL | Structured product and price-history storage |
| Firecrawl | Product data extraction from web pages |
| Resend | Transactional email notifications |
| Recharts | Interactive price-history visualizations |
| Google OAuth | User authentication |

## 🏗️ How It Works

The application follows a workflow that connects product tracking, data extraction, storage, and notifications.

```text
          ┌──────────────────────┐
          │       User           │
          │ Adds Product URL     │
          └──────────┬───────────┘
                     │
                     ▼
          ┌──────────────────────┐
          │      Next.js         │
          │  Web Application     │
          └──────────┬───────────┘
                     │
                     ▼
          ┌──────────────────────┐
          │      Firecrawl       │
          │  Extract Product Data│
          └──────────┬───────────┘
                     │
                     ▼
          ┌──────────────────────┐
          │       Supabase       │
          │ Product & Price Data │
          └──────────┬───────────┘
                     │
                     ▼
          ┌──────────────────────┐
          │  Price Comparison    │
          │  & History Updates   │
          └──────────┬───────────┘
                     │
                     ▼
          ┌──────────────────────┐
          │    Resend Email      │
          │ Price Drop Alerts    │
          └──────────────────────┘
```

*Note: This is a conceptual overview. The exact execution flow depends on the implemented application code and configuration.*

## 🚀 Getting Started

Follow these steps to run the project locally.

### Prerequisites

Before starting, make sure you have:

- [Node.js](https://nodejs.org/)
- npm
- A [GitHub](https://github.com/) account
- A [Supabase](https://supabase.com/) project
- A [Firecrawl](https://www.firecrawl.dev/) API key
- A [Resend](https://resend.com/) account for email notifications
- Google OAuth credentials if Google sign-in is enabled

### 1. Clone the Repository

Replace `KaranRaghav50` with your GitHub username.

```bash
git clone https://github.com/KaranRaghav50/smart-product-price-tracker.git
cd smart-product-price-tracker
```

### 2. Install Dependencies

```bash
npm install
```

### 3. Configure Environment Variables

Create a `.env.local` file in the project root.

```bash
touch .env.local
```

Add the environment variables required by the application, using the repository's example environment file or the variable names referenced in its source code.

Typical configuration categories include:

- Supabase project URL and API key
- Firecrawl API key
- Resend API key
- Google OAuth credentials, where required
- Application URL and authentication callback settings

**Important:** Use the exact variable names expected by your code. Never commit API keys, database secrets, OAuth client secrets, or other credentials to GitHub.

### 4. Configure Supabase

1. Create a Supabase project.
2. Configure the database and authentication providers.
3. Apply the SQL migrations included in the repository, if provided.
4. Configure the required authentication redirect URLs.
5. Confirm that the application has the necessary database permissions and policies.

### 5. Start the Development Server

```bash
npm run dev
```

Open the following address in your browser:

http://localhost:3000

To create a production build, use:

```bash
npm run build
npm run start
```

These commands assume the corresponding scripts are defined in `package.json`.

## 📂 Project Structure

The following is a high-level illustration of a typical Next.js App Router project. Your actual repository may contain different folders and files.

```text
smart-product-price-tracker/
│
├── app/                 # Pages, layouts and application routes
├── components/          # Reusable UI components
├── lib/                 # Shared utilities and integrations
├── public/              # Static assets
├── supabase/            # Database configuration or migrations
├── utils/               # Helper functions
├── .env.local           # Local environment variables (not committed)
├── .gitignore           # Files excluded from Git
├── package.json         # Dependencies and npm scripts
├── package-lock.json    # Dependency lockfile
└── README.md            # Project documentation
```

## 🔒 Security Considerations

- Keep all API keys and secrets in environment variables.
- Never expose privileged Supabase service-role credentials in client-side code.
- Configure appropriate Supabase Row Level Security (RLS) policies.
- Validate product URLs and user input on the server.
- Restrict access to users' private tracking data.
- Use secure authentication and authorization practices.

## 🌱 Future Improvements

Potential enhancements for future versions include:

- 📊 Advanced price-trend analysis and statistics.
- 🎯 User-defined target prices and alert thresholds.
- 🏷️ Product comparison across multiple retailers.
- 📈 Lowest-price indicators and price summaries.
- 🔔 More customizable notification preferences.
- ☁️ Automated deployment and monitoring.
- 🧪 Automated testing and improved error handling.

These are proposed improvements and should not be considered implemented features unless they are present in the code.

## 🎓 Learning Outcomes

This project provides an opportunity to explore:

- Full-stack web development using Next.js and React.
- Third-party API integration and data extraction.
- Database design and cloud backend integration.
- Authentication and authorization.
- Scheduled tasks and automation.
- Email notification workflows.
- Data visualization and responsive UI development.
- Environment configuration and application deployment.

## 🤝 Contributions

Contributions, suggestions, and bug reports are welcome.

1. Fork the repository.
2. Create a feature branch.
3. Make your changes.
4. Test your implementation.
5. Submit a pull request with a clear description of your changes.



## 📄 License

Add a license appropriate to your repository after checking the original project's license and your redistribution rights.

## 👨‍💻 Maintainer

**YOUR NAME**

- GitHub: [@KaranRaghav50](https://github.com/KaranRaghav50)
- Github: https://github.com/KaranRaghav50/Smart-Price-Tracker

---

⭐ If you find this project useful, consider giving the repository a star.Thanks.
