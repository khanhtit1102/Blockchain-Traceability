<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Truy Xuất Nguồn Gốc - Chè Thái Nguyên</title>

    <!-- Google Fonts: Be Vietnam Pro -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Be+Vietnam+Pro:wght@300;400;500;700&display=swap"
        rel="stylesheet">

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />

    <!-- AOS (Animate On Scroll) Library CSS -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <!-- Lightbox2 CSS - Thư viện phóng to ảnh -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.4/css/lightbox.min.css" rel="stylesheet" />
    <!-- Google tag (gtag.js) -->
    <script async src="https://www.googletagmanager.com/gtag/js?id={{ setting('site.google_analytics_tracking_id') }}">
    </script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', '{{ setting('site.google_analytics_tracking_id') }}');
    </script>
    <style>
        :root {
            --primary-color: #006837;
            /* Green from tea leaves */
            --secondary-color: #B9936C;
            /* Gold/Brown for dried tea */
            --text-color: #333;
            --light-bg: #f8f9fa;
            --white-color: #fff;
            --font-family: 'Be Vietnam Pro', sans-serif;
            --light-primary-color: #e0f2f1;
            --success-color: #4CAF50;
            --dark-text: #263238;
            --light-text: #555;
        }

        body {
            font-family: var(--font-family);
            color: var(--text-color);
            background-color: var(--white-color);
        }

        /* ========= NAVBAR ========= */
        .navbar {
            background-color: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .navbar-brand img {
            height: 45px;
        }

        .navbar .nav-link {
            font-weight: 500;
            color: var(--text-color);
            position: relative;
            padding: 8px 16px;
            transition: color 0.3s ease;
        }

        .navbar .nav-link:hover,
        .navbar .nav-link.active {
            color: var(--primary-color);
        }

        .navbar .nav-link::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background-color: var(--primary-color);
            transition: width 0.3s ease;
        }

        .navbar .nav-link:hover::after,
        .navbar .nav-link.active::after {
            width: 70%;
        }

        /* Header Search Form */
        .search-form-header .form-control {
            border-right: none;
        }

        .search-form-header .form-control:focus {
            box-shadow: none;
            border-color: #ced4da;
        }

        .search-form-header .btn-scan-header {
            border: 1px solid #ced4da;
            border-left: none;
            border-right: none;
            color: #6c757d;
        }

        .search-form-header .btn-scan-header:hover {
            background-color: #e9ecef;
        }

        .search-form-header .btn-submit-header {
            background-color: var(--primary-color);
            color: var(--white-color);
        }

        .search-form-header .btn-submit-header:hover {
            opacity: 0.9;
        }


        /* ========= HERO SECTION ========= */
        .hero-section {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://images.unsplash.com/photo-1597910037242-3535de99436c?q=80&w=2070&auto=format&fit=crop');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            padding: 120px 0;
            color: var(--white-color);
            text-align: center;
        }

        .hero-section h1 {
            font-weight: 900;
            font-size: 4rem;
            text-shadow: 2px 2px 8px rgba(0, 0, 0, 0.7);
        }

        .hero-section .lead {
            font-size: 1.5rem;
            font-weight: 300;
            margin-bottom: 30px;
        }

        .hero-section .trace-form .input-group {
            max-width: 600px;
            margin: 0 auto;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 50px;
            padding: 0.5rem;
            backdrop-filter: blur(5px);
        }

        .hero-section .trace-form .form-control,
        .hero-section .trace-form .btn {
            background: transparent;
            border: none;
            box-shadow: none;
            color: white;
        }

        .hero-section .trace-form .form-control {
            font-size: 1.1rem;
            padding-left: 1rem;
        }

        .hero-section .trace-form .form-control:focus {
            background: transparent;
            color: white;
        }

        .hero-section .trace-form .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }

        .hero-section .trace-form .btn-scan {
            font-size: 1.2rem;
            padding: 0 1rem;
        }

        .hero-section .trace-form .btn-scan:hover {
            color: var(--secondary-color);
        }

        .hero-section .trace-form .btn-trace {
            background-color: var(--secondary-color);
            border-radius: 50px !important;
            padding: 10px 30px;
            font-weight: 700;
            transition: all 0.3s ease;
        }

        .hero-section .btn-trace:hover {
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        /* ========= FOOTER ========= */
        footer {
            background-color: #1a1a1a;
            color: #a0a0a0;
        }

        footer h5 {
            color: var(--white-color);
            margin-bottom: 20px;
            font-weight: 700;
        }

        footer a {
            color: #a0a0a0;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        footer a:hover {
            color: var(--white-color);
        }

        footer .social-icons a {
            font-size: 1.5rem;
            margin: 0 10px;
        }

        /* QR Reader Modal style */
        #qr-reader {
            border-radius: 10px;
            overflow: hidden;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .search-form-header {
                display: none !important;
            }

            /* Hide header search on medium screens */
            .hero-section h1 {
                font-size: 3rem;
            }
        }
    </style>
    @yield('css')
</head>

<body>

    <!-- ========= NAVBAR ========= -->
    <header class="navbar navbar-expand-lg sticky-top">
        <div class="container">
            <a class="navbar-brand" href="#"><img src="https://placehold.co/120x40/006837/FFFFFF?text=CheViet"
                    alt="Logo Chè Việt"></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"><span
                    class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link active" href="#">Trang Chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Sản Phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Câu Chuyện</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Nhà Sản Xuất</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a></li>
                </ul>
                <form id="trace-form-header" class="d-lg-flex search-form-header" action="{{ route('search') }}" method="POST">
                    @csrf
                    <div class="input-group">
                        <input id="trace-input-header" class="form-control" name="trace_code" type="search"
                            placeholder="Nhập mã truy xuất..." required>
                        <button class="btn btn-scan-header" type="button" data-bs-toggle="modal"
                            data-bs-target="#qrScannerModal">
                            <i class="fa-solid fa-camera"></i>
                        </button>
                        <button class="btn btn-submit-header" type="submit"><i
                                class="fa-solid fa-magnifying-glass"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </header>

    <main class="container">
        @yield('content')
    </main>

    <!-- ========= FOOTER ========= -->
    <footer class="pt-5 pb-4">
        <!-- Footer content goes here, same as before -->
        <div class="container text-center text-md-start">
            <div class="row text-center text-md-start">
                <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4">CheViet Trace</h5>
                    <p>Dự án ứng dụng công nghệ Blockchain trong truy xuất nguồn gốc chè Thái Nguyên, mang lại sự minh
                        bạch và tin cậy cho người tiêu dùng.</p>
                    <div class="social-icons mt-4">
                        <a href="#" class="text-reset"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="text-reset"><i class="fab fa-youtube"></i></a>
                        <a href="#" class="text-reset"><i class="fab fa-github"></i></a>
                    </div>
                </div>
                <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4">Sản phẩm</h5>
                    <p><a href="#">Chè Móc Câu</a></p>
                    <p><a href="#">Chè Đinh Ngọc</a></p>
                    <p><a href="#">Chè Tôm Nõn</a></p>
                    <p><a href="#">Trà Oolong</a></p>
                </div>
                <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4">Liên kết</h5>
                    <p><a href="#">Về chúng tôi</a></p>
                    <p><a href="#">Câu hỏi thường gặp</a></p>
                    <p><a href="#">Điều khoản dịch vụ</a></p>
                    <p><a href="#">Chính sách bảo mật</a></p>
                </div>
                <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                    <h5 class="text-uppercase mb-4">Liên hệ</h5>
                    <p><i class="fas fa-home me-3"></i>Thái Nguyên, Việt Nam</p>
                    <p><i class="fas fa-envelope me-3"></i>info@cheviet.vn</p>
                    <p><i class="fas fa-phone me-3"></i>+84 123 456 789</p>
                </div>
            </div>
            <hr class="my-3">
            <div class="text-center">
                <p>&copy; 2025. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    <!-- QR Code Scanner Modal -->
    <div class="modal fade" id="qrScannerModal" tabindex="-1" aria-labelledby="qrScannerModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="qrScannerModalLabel">Quét mã QR sản phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body text-center">
                    <div id="qr-reader" style="width: 100%;"></div>
                    <p class="mt-3 text-muted">Di chuyển camera đến gần mã QR để quét.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- SCRIPTS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/lightbox2/2.11.4/js/lightbox.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/ethers@6.6.2/dist/ethers.umd.min.js"></script>
    <script src="https://unpkg.com/html5-qrcode" type="text/javascript"></script>
    <script>
        const traceRoute = "{{ route('trace', ['trace_code' => '000000']) }}";
        $(document).ready(function() {
            // Initialize AOS
            AOS.init({
                duration: 800,
                once: false,
                offset: 50
            });

            // --- QR Code Scanner Logic (jQuery) ---
            const $qrModal = $('#qrScannerModal');
            let html5QrCode;
            let $activeTraceInput = null; // To store which jQuery input object to populate

            // Handle form submissions
            $('#trace-form-hero, #trace-form-header').on('submit', function(event) {
                // event.preventDefault();
                // const $input = $(this).find('input[type="search"]');
                // const code = $input.val().trim();

                // if (code) {
                //     const traceUrl = traceRoute.replace('000000', code);
                //     window.open(traceUrl, '_new');
                // } else {
                //     alert("Vui lòng nhập mã sản phẩm để truy xuất.");
                // }
            });

            // Set the active input field when a scan button is clicked
            $('[data-bs-target="#qrScannerModal"]').on('click', function() {
                // Find the input within the same form as the clicked button
                $activeTraceInput = $(this).closest('form').find('input[type="search"]');
            });

            // Function to be called on successful scan
            const onScanSuccess = (decodedText, decodedResult) => {
                console.log(`Scan result: ${decodedText}`);

                if (html5QrCode && html5QrCode.isScanning) {
                    html5QrCode.stop().then(() => {
                        if ($activeTraceInput) {
                            $activeTraceInput.val(decodedText);
                            // Trigger the submit event on the form that the active input belongs to
                            $activeTraceInput.closest('form').trigger('submit');
                        }
                        $qrModal.modal('hide');
                    }).catch(err => {
                        console.error("Failed to stop scanning.", err);
                        if ($activeTraceInput) {
                            $activeTraceInput.closest('form').trigger('submit');
                        }
                        $qrModal.modal('hide');
                    });
                }
            };

            const onScanError = (errorMessage) => {
                /* ignore */
            };

            // Event listener for when the modal is shown
            $qrModal.on('shown.bs.modal', function() {
                const config = {
                    fps: 10,
                    qrbox: {
                        width: 250,
                        height: 250
                    },
                    supportedScanTypes: [Html5QrcodeScanType.SCAN_TYPE_CAMERA]
                };
                html5QrCode = new Html5Qrcode("qr-reader");
                html5QrCode.start({
                    facingMode: "environment"
                }, config, onScanSuccess, onScanError);
            });

            // Event listener for when the modal is hidden
            $qrModal.on('hidden.bs.modal', function() {
                if (html5QrCode && html5QrCode.isScanning) {
                    html5QrCode.stop().catch(err => console.error("Error stopping scanner on modal close.",
                        err));
                }
            });
        });
    </script>
    @yield('js')
</body>

</html>
