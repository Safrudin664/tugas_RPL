<?php
include 'koneksi/koneksi.php';

// SQL query to get data from the images table
$sql = "SELECT id, name, image, url FROM images";
$result = $conn->query($sql);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Sahabat Sehat</title>
  <link rel="stylesheet" href="css/style.css" />

  <!-- Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Merienda:wght@300..900&family=Poppins:ital,wght@0,400;1,600&display=swap" rel="stylesheet" />

  <!-- Iconify -->
  <script src="https://code.iconify.design/iconify-icon/2.2.0/iconify-icon.min.js"></script>

  <style>
    .hidden-content {
      display: none;
      margin-top: 10px;
      animation: fadeIn 0.5s ease-in-out;
    }

    @keyframes fadeIn {
      from {opacity: 0;}
      to {opacity: 1;}
    }

    .dokter-list {
      list-style: none;
      padding: 0;
    }

    .dokter-list li {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    }

    .dokter-list img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      margin-right: 10px;
    }
  </style>
</head>
<body>
  <!-- Navbar Start -->
  <nav class="navbar">
    <a href="#" class="navbar-logo">Sahabat Kecantikan</a>
    <div class="navbar-nav">
      <a href="#home">Home</a>
      <a href="paket.php">Paket perawatan</a>
    </div>
    <div class="navbar-login">
      <a href="masuk.php">Login</a>
    </div>
  </nav>
  <!-- Navbar End -->

  <!-- Hero Home Section Start -->
  <div>
    <section class="hero" id="home">
      <img src="img/img3.png" alt="Hero Image" />
      <div>
        <h1>Konsultasi <span>Kecantikan</span> Dengan Tepat Dan Akurat</h1>
        <p>
          Kami berkomitmen membantu Anda memahami, merawat, dan meningkatkan
          kesehatan kulit serta kecantikan Anda melalui sistem informasi yang handal.
        </p>
      </div>
    </section>

    <!-- Content Section -->
    <section class="content" id="home">
      <!-- Lokasi Klinik -->
      <div class="card" onclick="toggleContent('lokasi-content')">
        <iconify-icon icon="weui:location-outlined" width="80" height="80"></iconify-icon>
        <h3>Lokasi klinik</h3>
        <p>Website ini menawarkan informasi lengkap dan terhubung dengan 10+ klinik yang ada di Indonesia.</p>
        <div id="lokasi-content" class="hidden-content">
          <iframe
            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3958.3318298966894!2d112.72007991477392!3d-7.20343119479881!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2dd7fb0dc8db7e9f%3A0x8c8c4a2162c14cd5!2sSahabat%20Cantik%20Clinic!5e0!3m2!1sid!2sid!4v1719568341726!5m2!1sid!2sid"
            width="100%" height="200" style="border:0;" allowfullscreen="" loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
      </div>

      <!-- Dokter -->
      <div class="card" onclick="toggleContent('dokter-content')">
        <iconify-icon icon="healthicons:doctor-male-outline" width="80" height="80"></iconify-icon>
        <h3>Dokter</h3>
        <p>Website ini menawarkan informasi lengkap dan terhubung dengan 20+ dokter kecantikan yang ada di klinik SahabatCantik.</p>
        <div id="dokter-content" class="hidden-content">
          <ul class="dokter-list">
  <li>
    <img src="https://ui-avatars.com/api/?name=Dr+Willy+Sp.KK&background=random&rounded=true" alt="Dr. Willy">
    Dr. Willy, Sp.KK
  </li>
  <li>
    <img src="https://ui-avatars.com/api/?name=Dr+Richard+Le+Sp.KK&background=random&rounded=true" alt="Dr. Richard">
    Dr. Richard Le, Sp.KK
  </li>
  <li>
    <img src="https://ui-avatars.com/api/?name=Dr+Nur+Putri+Nuzul+Iryani+Sp.D.V.E&background=random&rounded=true" alt="Dr. Nur">
    Dr. Nur Putri Nuzul Iryani Sp.D.V.E
  </li>
  <li>
    <img src="https://ui-avatars.com/api/?name=Dr+Siska+Sp.KK&background=random&rounded=true" alt="Dr. Siska">
    Dr. Siska, Sp.KK
  </li>
</ul>

        </div>
      </div>

      <!-- Informasi -->
      <div class="card" onclick="toggleContent('info-content')">
        <iconify-icon icon="majesticons:note-text-plus-line" width="80" height="80"></iconify-icon>
        <h3>Informasi</h3>
        <p>Website ini menyediakan informasi terkait berbagai jenis perawatan kecantikan yang direkomendasikan oleh dokter.</p>
        <div id="info-content" class="hidden-content">
          <p>
           Klinik SahabatCantik menyediakan layanan facial, chemical peeling, botox, filler, dan konsultasi dermatologi. Setiap perawatan ditangani oleh dokter profesional dengan peralatan modern.
Kami juga menghadirkan teknologi terkini seperti laser rejuvenation, microneedling, dan mesotherapy untuk hasil perawatan yang lebih optimal dan minim downtime.
          </p>
        </div>
      </div>
    </section>
  </div>
  <!-- Hero Section End -->

  <!-- Artikel Section Start -->
  <div>
    <h2 style="text-align: center; margin-bottom: 30px;">Artikel Perawatan Kecantikan</h2>
    <section class="articles">
      <div class="card-wrapper">
        <?php
        if ($result->num_rows > 0) {
            $counter = 0;
            while ($row = $result->fetch_assoc()) {
                if ($counter == 10) break;
                echo '<div class="card">';
                echo '<a href="' . htmlspecialchars($row["url"]) . '" target="_blank" rel="noopener noreferrer">';
                echo '<img src="' . htmlspecialchars($row["image"]) . '" alt="' . htmlspecialchars($row["name"]) . '" />';
                echo '<h3>' . htmlspecialchars($row["name"]) . '</h3>';
                echo '</a>';
                echo '</div>';
                $counter++;
            }
        } else {
            echo "<p>No articles found.</p>";
        }
        ?>
      </div>
    </section>
  </div>
  <!-- Artikel Section End -->

  <!-- Footer -->
  <footer>
    <div class="social-icons">
      <a href="https://facebook.com" target="_blank" rel="noopener noreferrer">
        <iconify-icon icon="mdi:facebook" width="24" height="24"></iconify-icon>
      </a>
      <a href="https://twitter.com" target="_blank" rel="noopener noreferrer">
        <iconify-icon icon="mdi:twitter" width="24" height="24"></iconify-icon>
      </a>
      <a href="https://instagram.com" target="_blank" rel="noopener noreferrer">
        <iconify-icon icon="mdi:instagram" width="24" height="24"></iconify-icon>
      </a>
    </div>
    <p>
      &copy; 2025 Sahabat Cantik. All Rights Reserved. | 
      <a href="privacy-policy.html">Privacy Policy</a> | 
      <a href="terms.html">Terms of Service</a>
    </p>
  </footer>

  <!-- JavaScript Toggle -->
  <script>
    function toggleContent(id) {
      const content = document.getElementById(id);
      content.style.display = content.style.display === "block" ? "none" : "block";
    }
  </script>
</body>
</html>

<?php
$conn->close();
?>
