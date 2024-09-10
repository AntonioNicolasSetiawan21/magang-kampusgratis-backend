# Gunakan image Node.js resmi sebagai image dasar
FROM node:16-alpine

# Tetapkan direktori kerja di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json
COPY package*.json ./

# Install dependensi proyek
RUN npm install

# Salin semua file aplikasi
COPY . .

# Buat direktori dist jika belum ada
RUN mkdir -p dist

# Install tsc globally
RUN npm install -g typescript

# Jalankan build aplikasi (misalnya menggunakan webpack atau tsc)
RUN npm run build

# Salin file server.js ke direktori dist
RUN cp index.js dist/

# Buka port yang digunakan aplikasi
EXPOSE 8080

# Jalankan aplikasi
CMD ["node", "dist/index.js"]