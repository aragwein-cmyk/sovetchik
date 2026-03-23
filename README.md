# Sovetchik

AI-powered job search assistant with authentication system.

## 🚀 Quick Start

### 1. Install dependencies
```bash
install.bat
```

### 2. Setup EmailJS (for email verification)
```bash
setup-emailjs.bat
```

### 3. Start development server
```bash
start.bat
```

### 4. Open in browser
```
http://localhost:3000
```

## 📧 Email Configuration

Update `utils/emailServiceDirect.ts` with your EmailJS credentials:

```typescript
const EMAILJS_CONFIG = {
  serviceID: 'your_service_id',
  templateID: 'your_template_id', 
  userID: 'your_public_key'
};
```

## 🏗️ Project Structure

```
sovetchik/
├── app/                    # Next.js app directory
├── components/              # React components
├── utils/                  # Utility functions
├── api/                    # API routes
├── install.bat             # Install dependencies
├── start.bat              # Start development server
├── setup-emailjs.bat      # Setup EmailJS configuration
└── package.json           # Project dependencies
```

## 🔧 Development

### Available Scripts
- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run start` - Start production server

### Authentication Flow
1. User registers with email/password
2. Verification code sent via EmailJS
3. User enters code to confirm email
4. User can login with credentials

## 📦 Dependencies

- Next.js 14.2.18
- React 18.3.1
- Tailwind CSS 3.4.15
- TypeScript 5.5.0

## 🌐 Deployment

Build and deploy to Vercel or any Node.js hosting platform.
