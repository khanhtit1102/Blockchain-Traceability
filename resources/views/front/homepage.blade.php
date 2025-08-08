@extends('front.layouts.main')
@section('css')
    <style>
        /* ========= HERO SECTION ========= */
        .hero-section {
            background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('https://picsum.photos/1600/900?random=401');
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
            animation: pulse-glow 2.5s infinite;
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

        /* ========= SECTION STYLING ========= */
        .section-title {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-title h2 {
            font-weight: 700;
            color: var(--primary-color);
            position: relative;
            display: inline-block;
            padding-bottom: 10px;
        }

        .section-title h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 3px;
            background-color: var(--secondary-color);
        }

        .section-title p {
            max-width: 700px;
            margin: 10px auto 0;
            color: #6c757d;
        }

        /* ========= WHY BLOCKCHAIN SECTION ========= */
        .why-blockchain {
            padding: 80px 0;
            background-color: var(--light-bg);
        }

        .feature-box {
            text-align: center;
            padding: 30px;
            border-radius: 15px;
            background: var(--white-color);
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.07);
            transition: all 0.3s ease;
            height: 100%;
        }

        .feature-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .feature-box .icon {
            font-size: 3rem;
            color: var(--primary-color);
            margin-bottom: 20px;
        }

        .feature-box h4 {
            font-weight: 700;
            margin-bottom: 15px;
            color: var(--text-color);
        }

        /* ========= PROCESS SECTION ========= */
        .process-section {
            padding: 80px 0;
        }

        .timeline {
            position: relative;
            max-width: 1200px;
            margin: 0 auto;
        }

        .timeline::after {
            content: '';
            position: absolute;
            width: 6px;
            background-color: var(--primary-color);
            top: 0;
            bottom: 0;
            left: 50%;
            margin-left: -3px;
            z-index: 1;
        }

        .timeline-container {
            padding: 10px 40px;
            position: relative;
            background-color: inherit;
            width: 50%;
        }

        .timeline-container.left {
            left: 0;
        }

        .timeline-container.right {
            left: 50%;
        }

        .timeline-container::after {
            content: '';
            position: absolute;
            width: 35px;
            height: 35px;
            right: -17px;
            background-color: white;
            border: 4px solid var(--secondary-color);
            top: 30px;
            border-radius: 50%;
            z-index: 2;
        }

        .timeline-container.right::after {
            left: -18px;
        }

        .timeline-content {
            padding: 20px 30px;
            background-color: var(--light-bg);
            position: relative;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .timeline-content .icon {
            font-size: 2rem;
            color: var(--primary-color);
            float: left;
            margin-right: 15px;
        }

        .timeline-content h3 {
            font-size: 1.2rem;
            font-weight: 700;
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

        /* Animation Keyframes */
        @keyframes pulse-glow {
            0% {
                box-shadow: 0 0 0 0 rgba(255, 255, 255, 0.5);
            }

            70% {
                box-shadow: 0 0 0 15px rgba(255, 255, 255, 0);
            }

            100% {
                box-shadow: 0 0 0 0 rgba(255, 255, 255, 0);
            }
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

        @media (max-width: 768px) {
            .hero-section {
                padding: 80px 0;
            }

            .hero-section h1 {
                font-size: 2.5rem;
            }

            .hero-section .lead {
                font-size: 1.2rem;
            }

            .timeline::after {
                left: 31px;
            }

            .timeline-container {
                width: 100%;
                padding-left: 70px;
                padding-right: 25px;
            }

            .timeline-container.left,
            .timeline-container.right {
                left: 0%;
            }

            .timeline-container.left::after,
            .timeline-container.right::after {
                left: 15px;
            }
        }
    </style>
@endsection
@section('content')
    <main class="">
        <!-- ========= HERO SECTION ========= -->
        <section class="hero-section">
            <div class="container" data-aos="fade-up">
                <h1 class="display-3">TINH HOA CHÈ THÁI NGUYÊN</h1>
                <p class="lead">Minh bạch trong từng búp trà. Truy xuất nguồn gốc bằng công nghệ Blockchain.</p>
                <form id="trace-form-hero" class="trace-form" role="search" action="{{ route('search') }}" method="POST">
                    @csrf
                    <div class="input-group">
                        <input id="trace-input-hero" class="form-control" name="trace_code" type="search"
                            placeholder="Nhập mã sản phẩm hoặc quét QR..." required>
                        <button class="btn btn-scan" type="button" data-bs-toggle="modal" data-bs-target="#qrScannerModal">
                            <i class="fa-solid fa-camera"></i>
                        </button>
                        <button class="btn btn-trace" type="submit">Truy Xuất</button>
                    </div>
                </form>
            </div>
        </section>

        <!-- ========= WHY BLOCKCHAIN SECTION ========= -->
        <section class="why-blockchain">
            <div class="container">
                <div class="section-title" data-aos="fade-up">
                    <h2>Tại Sao Lại Là Blockchain?</h2>
                    <p>Công nghệ Blockchain mang đến một kỷ nguyên mới cho sự minh bạch, đảm bảo mỗi thông tin về sản phẩm
                        đều
                        được ghi nhận một cách an toàn và không thể thay đổi.</p>
                </div>
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="100">
                        <div class="feature-box">
                            <div class="icon"><i class="fa-solid fa-sitemap"></i></div>
                            <h4>Minh Bạch Tuyệt Đối</h4>
                            <p>Toàn bộ nhật ký từ trồng trọt, thu hoạch đến chế biến đều được công khai và dễ dàng truy cập.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="200">
                        <div class="feature-box">
                            <div class="icon"><i class="fa-solid fa-shield-halved"></i></div>
                            <h4>Dữ Liệu Bất Biến</h4>
                            <p>Một khi thông tin đã được ghi vào chuỗi khối (blockchain), không ai có thể sửa đổi hay xóa
                                bỏ.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="300">
                        <div class="feature-box">
                            <div class="icon"><i class="fa-solid fa-handshake"></i></div>
                            <h4>Tăng Cường Tin Cậy</h4>
                            <p>Người tiêu dùng có thể tự mình kiểm chứng nguồn gốc, chất lượng sản phẩm chỉ với một mã QR.
                            </p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6" data-aos="fade-up" data-aos-delay="400">
                        <div class="feature-box">
                            <div class="icon"><i class="fa-solid fa-arrow-trend-up"></i></div>
                            <h4>Nâng Tầm Giá Trị</h4>
                            <p>Sự minh bạch giúp khẳng định giá trị thương hiệu chè Thái Nguyên trên thị trường trong và
                                ngoài
                                nước.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ========= PROCESS SECTION ========= -->
        <section class="process-section">
            <div class="container">
                <div class="section-title" data-aos="fade-down">
                    <h2>Hành Trình Của Búp Chè</h2>
                    <p>Theo dõi từng bước đi của sản phẩm, từ những đồi chè xanh mướt tại Thái Nguyên cho đến khi trở thành
                        ấm
                        trà thơm ngon trong tay bạn.</p>
                </div>
                <div class="timeline">
                    <div class="timeline-container left" data-aos="fade-right">
                        <div class="timeline-content">
                            <i class="fa-solid fa-seedling icon"></i>
                            <div>
                                <h3>1. Gieo Trồng & Chăm Sóc</h3>
                                <p>Nhật ký về giống chè, quy trình chăm sóc hữu cơ, sử dụng phân bón, nguồn nước được ghi
                                    lại.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline-container right" data-aos="fade-left">
                        <div class="timeline-content">
                            <i class="fa-solid fa-hand-holding-droplet icon"></i>
                            <div>
                                <h3>2. Thu Hoạch</h3>
                                <p>Thời gian, địa điểm, và phương pháp thu hái (ví dụ: 1 tôm 2 lá) được xác thực trên
                                    Blockchain.</p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline-container left" data-aos="fade-right">
                        <div class="timeline-content">
                            <i class="fa-solid fa-gear icon"></i>
                            <div>
                                <h3>3. Chế Biến</h3>
                                <p>Các công đoạn sao, vò, sấy chè tại nhà máy, cùng với tiêu chuẩn chất lượng được lưu trữ.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline-container right" data-aos="fade-left">
                        <div class="timeline-content">
                            <i class="fa-solid fa-box-archive icon"></i>
                            <div>
                                <h3>4. Đóng Gói & Dán Nhãn</h3>
                                <p>Sản phẩm được đóng gói, dán nhãn QR độc nhất. Thông tin lô, ngày sản xuất được cập nhật.
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="timeline-container left" data-aos="fade-right">
                        <div class="timeline-content">
                            <i class="fa-solid fa-mug-hot icon"></i>
                            <div>
                                <h3>5. Đến Tay Bạn</h3>
                                <p>Quét mã QR trên bao bì để xem toàn bộ hành trình minh bạch của sản phẩm mà bạn đang cầm
                                    trên
                                    tay.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
@endsection
@section('js')
@endsection
