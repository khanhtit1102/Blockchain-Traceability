@extends('front.layouts.main')
@section('css')
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <style>
        /* --- HERO SECTION --- */
        .hero-section {
            position: relative;
            padding: 8rem 0;
            color: white;
            background-image: url('https://picsum.photos/1600/900?random=401');
            background-size: cover;
            background-position: center;
        }

        .hero-section::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to right, rgba(0, 77, 64, 0.8), rgba(0, 121, 107, 0.6));
        }

        .hero-section .container {
            position: relative;
            z-index: 2;
        }

        .hero-section h1 {
            font-size: 3.5rem;
            font-weight: 800;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }

        .hero-section .lead {
            font-size: 1.25rem;
            max-width: 600px;
        }

        .btn-cta {
            background-image: linear-gradient(to right, #FFC107 0%, #FF9800 51%, #FFC107 100%);
            padding: 12px 30px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: var(--dark-text);
            box-shadow: 0 0 20px #00000033;
            border-radius: 30px;
            font-weight: 700;
            font-size: 1.1rem;
            animation: pulse 2s infinite;
            /* Hiệu ứng tỏa sáng cho nút CTA */
        }

        .btn-cta:hover {
            background-position: right center;
            color: var(--dark-text);
            animation: none;
        }

        /* --- BENEFITS SECTION --- */
        .benefits-section .icon-box {
            color: var(--primary-color);
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .benefits-section .card {
            border: none;
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            transition: transform 0.3s ease;
            height: 100%;
        }

        .benefits-section .card:hover {
            transform: translateY(-10px);
        }

        /* --- PARTNERS SECTION --- */
        .partners-section img {
            max-height: 60px;
            filter: grayscale(100%);
            opacity: 0.6;
            transition: all 0.3s ease;
        }

        .partners-section img:hover {
            filter: grayscale(0%);
            opacity: 1;
        }

        /* --- TESTIMONIALS SECTION --- */
        .testimonial-card {
            background-color: white;
            border-left: 5px solid var(--primary-color);
            border-radius: 12px;
            box-shadow: var(--card-shadow);
            height: 100%;
            /* Đảm bảo các card có chiều cao bằng nhau trong slide */
        }

        .testimonial-card img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            border: 3px solid var(--primary-color);
        }

        .testimonial-card .quote {
            font-style: italic;
            color: var(--light-text);
        }

        .testimonial-card .author {
            font-weight: 700;
        }

        /* Custom Swiper Styles */
        .testimonial-slider .swiper-button-next,
        .testimonial-slider .swiper-button-prev {
            color: var(--primary-color);
        }

        .testimonial-slider .swiper-pagination-bullet-active {
            background-color: var(--primary-color);
        }


        /* --- REGISTRATION SECTION --- */
        .registration-section .form-control:focus {
            box-shadow: 0 0 0 0.25rem var(--light-primary-color);
            border-color: var(--primary-color);
        }

        /* --- HIỆU ỨNG TỎA SÁNG CHO NÚT --- */
        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(255, 193, 7, 0.7);
            }

            70% {
                box-shadow: 0 0 0 20px rgba(255, 193, 7, 0);
            }

            100% {
                box-shadow: 0 0 0 0 rgba(255, 193, 7, 0);
            }
        }
    </style>
@endsection

@section('content')
    <main>
        <!-- ========= HERO SECTION ========= -->
        <section class="hero-section text-center">
            <div class="container">
                <h1 class="display-4" data-aos="fade-down">Minh Bạch Hóa Nguồn Gốc,<br> Nâng Tầm Thương Hiệu Chè Việt</h1>
                <p class="lead mx-auto mt-3" data-aos="fade-up" data-aos-delay="200">Tham gia hệ sinh thái truy xuất nguồn gốc
                    bằng công nghệ Blockchain hàng đầu. Xây dựng niềm tin với khách hàng và mở rộng thị trường cho sản phẩm
                    của bạn.</p>
                <a href="#registration-form" class="btn btn-cta mt-4" data-aos="fade-up" data-aos-delay="400">Đăng Ký Hợp Tác
                    Ngay</a>
            </div>
        </section>

        <!-- ========= BENEFITS SECTION ========= -->
        <section class="benefits-section py-5">
            <div class="container text-center">
                <h2 class="fw-bold" data-aos="fade-up">Tại Sao Nên Chọn Chúng Tôi?</h2>
                <p class="text-muted mb-5" data-aos="fade-up" data-aos-delay="100">Những giá trị vượt trội mà hệ thống của
                    chúng tôi mang lại cho doanh nghiệp của bạn.</p>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="200">
                        <div class="card p-4">
                            <div class="icon-box"><i class="fa-solid fa-shield-halved"></i></div>
                            <h5 class="fw-bold">Chống Hàng Giả, Bảo Vệ Thương Hiệu</h5>
                            <p class="small text-muted">Mỗi sản phẩm được định danh duy nhất trên Blockchain, không thể làm
                                giả, giúp người tiêu dùng an tâm và bảo vệ uy tín của bạn.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="300">
                        <div class="card p-4">
                            <div class="icon-box"><i class="fa-solid fa-sack-dollar"></i></div>
                            <h5 class="fw-bold">Gia Tăng Giá Trị Sản Phẩm</h5>
                            <p class="small text-muted">Sự minh bạch về quy trình sản xuất sạch giúp nâng cao giá trị cảm
                                nhận của khách hàng, sẵn sàng chi trả cao hơn cho sản phẩm chất lượng.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="400">
                        <div class="card p-4">
                            <div class="icon-box"><i class="fa-solid fa-earth-americas"></i></div>
                            <h5 class="fw-bold">Mở Rộng Thị Trường Xuất Khẩu</h5>
                            <p class="small text-muted">Đáp ứng các tiêu chuẩn khắt khe về truy xuất nguồn gốc của các thị
                                trường khó tính như EU, Mỹ, Nhật Bản, mở ra cơ hội vươn ra thế giới.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ========= PARTNERS SECTION ========= -->
        <section class="partners-section bg-light py-5">
            <div class="container text-center" data-aos="fade-in">
                <h4 class="text-muted fw-light">Được tin tưởng bởi các thương hiệu hàng đầu</h4>
                <div class="d-flex flex-wrap justify-content-center align-items-center mt-4">
                    <img src="https://picsum.photos/150/60?random=501" alt="Partner Logo" class="m-3">
                    <img src="https://picsum.photos/150/60?random=502" alt="Partner Logo" class="m-3">
                    <img src="https://picsum.photos/150/60?random=503" alt="Partner Logo" class="m-3">
                    <img src="https://picsum.photos/150/60?random=504" alt="Partner Logo" class="m-3">
                    <img src="https://picsum.photos/150/60?random=505" alt="Partner Logo" class="m-3">
                </div>
            </div>
        </section>

        <!-- ========= TESTIMONIALS SECTION ========= -->
        <section class="testimonials-section py-5">
            <div class="container" data-aos="fade-up">
                <h2 class="fw-bold text-center">Nhà Sản Xuất Nói Gì Về Chúng Tôi?</h2>
                <p class="text-muted text-center mb-5">Lắng nghe chia sẻ từ những người đã tin tưởng và thành công cùng hệ
                    thống.</p>

                <!-- Swiper -->
                <div class="swiper testimonial-slider">
                    <div class="swiper-wrapper pb-5">
                        <div class="swiper-slide">
                            <div class="testimonial-card p-4">
                                <p class="quote">"Từ khi áp dụng hệ thống truy xuất nguồn gốc, sản lượng tiêu thụ của chúng
                                    tôi đã tăng 25%. Khách hàng tin tưởng hơn và không còn lo ngại về chè bẩn, chè giả nữa.
                                    Đây là một bước tiến vượt bậc!"</p>
                                <div class="d-flex align-items-center mt-3">
                                    <img src="https://picsum.photos/100/100?random=601" alt="Producer photo">
                                    <div class="ms-3">
                                        <div class="author">Bà Nguyễn Thị Mai</div>
                                        <div class="company text-muted small">HTX Chè Tân Cương Xanh</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="testimonial-card p-4">
                                <p class="quote">"Việc xuất khẩu sang thị trường Nhật Bản trở nên dễ dàng hơn rất nhiều.
                                    Đối tác chỉ cần quét mã QR là có đầy đủ thông tin, nhật ký sản xuất. Rất chuyên nghiệp
                                    và minh bạch."</p>
                                <div class="d-flex align-items-center mt-3">
                                    <img src="https://picsum.photos/100/100?random=602" alt="Producer photo">
                                    <div class="ms-3">
                                        <div class="author">Ông Lê Văn Hùng</div>
                                        <div class="company text-muted small">Công ty TNHH Chè Thái Nguyên</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="testimonial-card p-4">
                                <p class="quote">"Quản lý chất lượng và theo dõi lô hàng hiệu quả hơn hẳn. Hệ thống giúp
                                    chúng tôi phát hiện và khắc phục sự cố nhanh chóng, giảm thiểu rủi ro và chi phí không
                                    đáng có."</p>
                                <div class="d-flex align-items-center mt-3">
                                    <img src="https://picsum.photos/100/100?random=603" alt="Producer photo">
                                    <div class="ms-3">
                                        <div class="author">Chị Trần Thu Hà</div>
                                        <div class="company text-muted small">Trang trại Chè Hữu cơ</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                    <!-- Add Navigation -->
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                </div>
            </div>
        </section>

        <!-- ========= REGISTRATION SECTION ========= -->
        <section id="registration-form" class="registration-section bg-light py-5">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 mb-4 mb-lg-0" data-aos="fade-right">
                        <h2 class="fw-bold">Sẵn Sàng Chuyển Đổi?</h2>
                        <p class="text-muted">Hãy để lại thông tin của bạn. Đội ngũ chuyên gia của chúng tôi sẽ liên hệ để
                            tư vấn và hỗ trợ bạn tích hợp hệ thống một cách nhanh chóng và hiệu quả nhất.</p>
                        <p><strong>Cùng nhau, chúng ta sẽ đưa thương hiệu chè Việt vươn tầm thế giới!</strong></p>
                    </div>
                    <div class="col-lg-6" data-aos="fade-left">
                        <div class="card p-4 shadow-sm">
                            <h4 class="text-center mb-4">Form Đăng Ký Tư Vấn</h4>
                            <form action="#" method="POST">
                                <div class="mb-3">
                                    <label for="companyName" class="form-label">Tên công ty/HTX <span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="companyName" required>
                                </div>
                                <div class="mb-3">
                                    <label for="contactPerson" class="form-label">Người đại diện <span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control" id="contactPerson" required>
                                </div>
                                <div class="mb-3">
                                    <label for="email" class="form-label">Email <span
                                            class="text-danger">*</span></label>
                                    <input type="email" class="form-control" id="email" required>
                                </div>
                                <div class="mb-3">
                                    <label for="phone" class="form-label">Số điện thoại <span
                                            class="text-danger">*</span></label>
                                    <input type="tel" class="form-control" id="phone" required>
                                </div>
                                <div class="d-grid">
                                    <button type="submit" class="btn fw-bold"
                                        style="background-color: var(--primary-color); color: white;">Gửi Yêu Cầu</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main>
@endsection

@section('js')
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <script>
        // Khởi tạo AOS
        AOS.init({
            duration: 800, // Thời gian hiệu ứng
            once: true, // Chỉ chạy hiệu ứng một lần
            offset: 120, // Bắt đầu chạy hiệu ứng khi cách viewport 120px
        });

        // Khởi tạo Swiper cho testimonial slider
        const swiper = new Swiper('.testimonial-slider', {
            slidesPerView: 1,
            spaceBetween: 30,
            loop: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            breakpoints: {
                992: { // Khi màn hình rộng hơn 992px
                    slidesPerView: 2,
                    spaceBetween: 30
                }
            }
        });
    </script>
@endsection
