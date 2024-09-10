# Gunakan image Node.js resmi sebagai image dasar
FROM node:18-alpine

# Tetapkan direktori kerja di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Install dependensi proyek
RUN npm install

# Salin semua file aplikasi
COPY . .

EXPOSE 8080

# Jalankan build aplikasi (misalnya menggunakan webpack atau tsc)
RUN npx tsc


CMD ["npm", "run", "start"]