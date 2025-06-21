@extends('front.layouts.main')

@section('css')
    <style>
        .article-container {
            background: #fff;
            padding: 2rem 3rem;
            margin-top: 1rem;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, .07);
        }

        .article-header .article-category {
            font-size: 0.9rem;
            font-weight: 700;
            color: var(--primary-color);
            text-transform: uppercase;
        }

        .article-header .article-title {
            font-family: var(--heading-font);
            font-size: 2.5rem;
            font-weight: 700;
            margin-top: 0.5rem;
            color: var(--dark-text);
        }

        .article-meta {
            color: var(--light-text);
            font-size: 0.9rem;
        }

        .article-meta img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .article-meta .author-name {
            font-weight: 700;
            color: var(--dark-text);
        }

        .article-featured-image {
            width: 100%;
            height: auto;
            max-height: 500px;
            object-fit: cover;
            border-radius: 12px;
            margin: 2rem 0;
        }

        .article-content {
            font-family: var(--body-text-font);
            font-size: 1.1rem;
            line-height: 1.8;
            color: #333;
        }

        .article-content h3 {
            font-family: var(--heading-font);
            font-weight: 700;
            margin-top: 2rem;
            margin-bottom: 1rem;
        }

        .article-content blockquote {
            border-left: 4px solid var(--primary-color);
            padding-left: 1.5rem;
            margin: 2rem 0;
            font-style: italic;
            color: #666;
        }

        .article-tags .tag {
            display: inline-block;
            background-color: #e9ecef;
            color: var(--light-text);
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
            text-decoration: none;
            margin-right: 5px;
            margin-bottom: 5px;
            transition: all 0.2s ease;
        }

        .article-tags .tag:hover {
            background-color: var(--primary-color);
            color: white;
        }

        /* --- SIDEBAR --- */
        .sidebar {
            margin-top: 1rem;
        }

        .sidebar .widget {
            background: #fff;
            padding: 1.5rem;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, .07);
            margin-bottom: 2rem;
        }

        .sidebar .widget-title {
            font-family: var(--heading-font);
            font-size: 1.2rem;
            font-weight: 700;
            margin-bottom: 1rem;
            padding-bottom: 0.5rem;
        }

        /* WIDGET TÁC GIẢ */
        .sidebar .author-widget-img {
            width: 80px;
            height: 80px;
        }

        /* WIDGET AI */
        .ai-sidebar-widget {
            background: linear-gradient(135deg, #e0f2f1, #ffffff);
        }

        .btn-ai {
            background-image: linear-gradient(to right, #00796B 0%, #004D40 51%, #00796B 100%);
            padding: 8px 15px;
            text-align: center;
            text-transform: uppercase;
            transition: 0.5s;
            background-size: 200% auto;
            color: white;
            box-shadow: 0 0 10px #eee;
            border-radius: 10px;
            display: block;
            width: 100%;
            border: none;
        }

        .btn-ai:hover {
            background-position: right center;
            color: #fff;
        }

        #ai-answer-box {
            background: #fff;
            border-radius: 8px;
            padding: 1rem;
            margin-top: 1rem;
            min-height: 80px;
            white-space: pre-wrap;
            font-size: 0.9rem;
        }

        .typing-cursor {
            display: inline-block;
            width: 7px;
            height: 1rem;
            background-color: var(--dark-text);
            animation: blink 1s step-end infinite;
        }

        @keyframes blink {

            from,
            to {
                background-color: transparent
            }

            50% {
                background-color: var(--dark-text);
            }
        }

        /* WIDGET CHIA SẺ */
        .social-share-buttons .btn-social {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            color: #fff;
            margin: 0 5px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            transition: transform 0.2s;
        }

        .social-share-buttons .btn-social:hover {
            transform: translateY(-3px);
        }

        .social-share-buttons .facebook {
            background-color: #3b5998;
        }

        .social-share-buttons .twitter {
            background-color: #1da1f2;
        }

        .social-share-buttons .zalo {
            background-color: #0068ff;
        }

        .social-share-buttons .link {
            background-color: #6c757d;
        }

        /* WIDGET CHUYÊN MỤC */
        .sidebar .category-list li a {
            text-decoration: none;
            color: var(--dark-text);
            font-weight: 500;
        }

        .sidebar .category-list li a:hover {
            color: var(--primary-color);
        }

        /* WIDGET BÀI VIẾT MỚI */
        .sidebar .recent-post-item {
            display: flex;
            align-items: center;
        }

        .sidebar .recent-post-item img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            margin-right: 15px;
        }

        .sidebar .recent-post-item .post-title {
            font-size: 0.95rem;
            font-weight: 500;
            color: var(--dark-text);
            text-decoration: none;
            line-height: 1.4;
        }
    </style>
@endsection

@section('content')
    <main class="container">
        <div class="row">
            <!-- ========= MAIN ARTICLE CONTENT ========= -->
            <div class="col-lg-8">
                <article class="article-container">
                    <header class="article-header text-center">
                        <a href="#" class="article-category">{{ $post->category ? $post->category->name : '' }}</a>
                        <h1 class="article-title">{{ $post->title }}</h1>
                        <div class="article-meta mt-3 d-flex align-items-center justify-content-center">
                            <img src="{{ $post->authorId ? Voyager::image($post->authorId->avatar) : asset('resources/images/Image_not_available.png') }}"
                                alt="{{ $post->authorId ? $post->authorId->name : '' }}">
                            <span>Bởi <a href="#"
                                    class="author-name text-decoration-none">{{ $post->authorId ? $post->authorId->name : '' }}</a></span>
                            <span class="mx-2">&bullet;</span>
                            <span>{{ $post->created_at->format('d/m/Y') }}</span>
                        </div>
                    </header>

                    <img src="{{ $post->image ? Voyager::image($post->image) : asset('resources/images/Image_not_available.png') }}"
                        alt="{{ $post->title }}" class="article-featured-image">

                    <div class="article-content">
                        {!! $post->body !!}
                    </div>

                    <hr class="my-4">

                    <div class="article-tags">
                        <strong>Tags:</strong>
                        <a href="#" class="tag">blockchain</a>
                        <a href="#" class="tag">blockchain</a>
                        <a href="#" class="tag">blockchain</a>
                        <a href="#" class="tag">blockchain</a>
                    </div>
                </article>
            </div>
            <!-- ========= SIDEBAR ========= -->
            <aside class="col-lg-4">
                <div class="sidebar">
                    <!-- WIDGET VỀ TÁC GIẢ -->
                    <div class="widget text-center">
                        <h3 class="widget-title">Về Tác Giả</h3>
                        <img src="{{ $post->authorId ? Voyager::image($post->authorId->avatar) : asset('resources/images/Image_not_available.png') }}"
                            alt="Tác giả" class="author-widget-img rounded-circle mb-2">
                        <h5 class="mb-1">{{ $post->authorId ? $post->authorId->name : '' }}</h5>
                        <p class="mb-0 text-muted small">{{ $post->authorId ? $post->authorId->company_name : '' }}</p>
                        <p class="mb-0 text-muted small">{{ $post->authorId ? $post->authorId->address : '' }}</p>
                        <p class="mb-0 text-muted small">{{ $post->authorId ? $post->authorId->website : '' }}</p>
                        <p class="mb-0 text-muted small">{{ $post->authorId ? $post->authorId->phone : '' }}</p>
                    </div>

                    <!-- WIDGET AI -->
                    <div class="widget ai-sidebar-widget">
                        <h3 class="widget-title text-center">✨ Trợ Lý AI ✨</h3>
                        <button id="btn-summarize" class="btn-ai mb-3" data-bs-toggle="modal"
                            data-bs-target="#summaryModal"><i class="fa-solid fa-wand-magic-sparkles me-2"></i>Tóm Tắt
                            Nhanh</button>
                        <form id="ai-qa-form">
                            <div class="mb-2"><label for="ai-question-input" class="form-label small">Hỏi đáp về bài
                                    viết:</label>
                                <textarea class="form-control form-control-sm" id="ai-question-input" rows="2"
                                    placeholder="Lợi ích chính của blockchain là gì?"></textarea>
                            </div>
                            <button type="submit" class="btn-ai"><i class="fa-solid fa-paper-plane me-2"></i>Gửi Câu
                                Hỏi</button>
                        </form>
                        <div id="ai-answer-box" class="d-none"></div>
                    </div>

                    <!-- WIDGET CHIA SẺ -->
                    <div class="widget text-center">
                        <h3 class="widget-title">Chia Sẻ</h3>
                        <div class="social-share-buttons">
                            <a href="#" class="btn-social facebook" title="Chia sẻ lên Facebook"><i
                                    class="fab fa-facebook-f"></i></a>
                            <a href="#" class="btn-social twitter" title="Chia sẻ lên Twitter"><i
                                    class="fab fa-twitter"></i></a>
                            <a href="#" class="btn-social zalo" title="Chia sẻ qua Zalo"><i
                                    class="fa-solid fa-comment-dots"></i></a>
                            <a href="#" class="btn-social link" title="Sao chép liên kết"><i
                                    class="fas fa-link"></i></a>
                        </div>
                    </div>

                    <!-- WIDGET CHUYÊN MỤC -->
                    <div class="widget">
                        <h3 class="widget-title">Chuyên Mục</h3>
                        <ul class="list-unstyled category-list">
                            @foreach ($categories as $category)
                                <li class="mb-2 d-flex justify-content-between align-items-center"><a
                                        href="#">{{ $category->name }}</a><span
                                        class="badge bg-primary-subtle text-primary-emphasis rounded-pill">{{ $category->posts_count }}</span>
                                </li>
                            @endforeach

                        </ul>
                    </div>

                    <!-- WIDGET BÀI VIẾT MỚI -->
                    <div class="widget">
                        <h3 class="widget-title">Bài Viết Mới Nhất</h3>
                        <ul class="list-unstyled">
                            @foreach ($randomPosts as $randomPost)
                                <li class="mb-3"><a href="{{ route('posts.show', $randomPost->slug) }}"
                                        class="recent-post-item text-decoration-none"><img
                                            src="{{ $randomPost->image ? Voyager::image($randomPost->image) : asset('resources/images/Image_not_available.png') }}"
                                            alt="Ảnh bài viết">
                                        <div><span class="post-title">{{ $randomPost->title }}</span></div>
                                    </a></li>
                            @endforeach
                        </ul>
                    </div>
                </div>
            </aside>
        </div>
        <!-- MODAL FOR AI SUMMARY -->
        <div class="modal fade" id="summaryModal" tabindex="-1" aria-labelledby="summaryModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header" style="background-color: var(--primary-color); color: white;">
                        <h5 class="modal-title" id="summaryModalLabel">✨ Tóm Tắt Nội Dung Bởi AI</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                    </div>
                    <div class="modal-body" id="summary-content-box" style="min-height: 200px;">
                        <!-- Nội dung tóm tắt sẽ được đưa vào đây -->
                    </div>
                </div>
            </div>
        </div>
    </main>
@endsection

@section('js')
    <script>
        $(document).ready(function() {
            // --- CÁC HÀM TƯƠNG TÁC VỚI GEMINI API ---
            const API_KEY = "AIzaSyBf_-SxJ01swa2xQfCq-w8wKQxP0xe9i1Y"; // Để trống, Canvas sẽ tự động cung cấp
            const API_URL =
                `https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=${API_KEY}`;
            const articleContent = $('.article-content').text().trim();

            function typeEffect(element, text) {
                element.html("");
                let i = 0;
                const speed = 20;

                function type() {
                    if (i < text.length) {
                        element.append(text.charAt(i));
                        i++;
                        setTimeout(type, speed);
                    } else {
                        element.find('.typing-cursor').remove();
                    }
                }
                element.append('<span class="typing-cursor"></span>');
                type();
            }

            async function callGemini(prompt) {
                try {
                    const payload = {
                        contents: [{
                            role: "user",
                            parts: [{
                                text: prompt
                            }]
                        }]
                    };
                    const response = await fetch(API_URL, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json'
                        },
                        body: JSON.stringify(payload)
                    });
                    if (!response.ok) throw new Error(`API error! status: ${response.status}`);
                    const result = await response.json();
                    if (result.candidates && result.candidates.length > 0) {
                        return result.candidates[0].content.parts[0].text;
                    } else {
                        return "Xin lỗi, tôi không thể tạo phản hồi vào lúc này.";
                    }
                } catch (error) {
                    console.error("Error calling Gemini API:", error);
                    return "Đã xảy ra lỗi khi kết nối với AI. Vui lòng thử lại sau.";
                }
            }

            // --- SỰ KIỆN CHO NÚT TÓM TẮT ---
            $('#btn-summarize').on('click', async function() {
                const summaryBox = $('#summary-content-box');
                summaryBox.html(
                    '<div class="d-flex justify-content-center align-items-center p-5"><div class="spinner-border text-primary" role="status"></div><p class="ms-3 mb-0">AI đang đọc bài viết...</p></div>'
                );

                const prompt =
                    `Hãy tóm tắt bài viết sau đây thành các gạch đầu dòng ngắn gọn, súc tích bằng tiếng Việt:\n\n"${articleContent}"`;

                const summary = await callGemini(prompt);
                summaryBox.html('<ul class="list-unstyled">' + summary.replace(/\* /g,
                    '<li class="mb-2">'
                ) + '</li>' + '</ul>');
            });

            // --- SỰ KIỆN CHO FORM HỎI ĐÁP ---
            $('#ai-qa-form').on('submit', async function(e) {
                e.preventDefault();
                const question = $('#ai-question-input').val();
                if (!question) return;

                const answerBox = $('#ai-answer-box');
                answerBox.removeClass('d-none').html(
                    '<div class="d-flex align-items-center"><div class="spinner-border spinner-border-sm text-primary" role="status"></div><p class="ms-2 mb-0">AI đang suy nghĩ...</p></div>'
                );

                const prompt =
                    `Dựa vào nội dung của bài viết sau: "${articleContent}".\n\nHãy trả lời câu hỏi một cách ngắn gọn và chính xác nhất có thể bằng tiếng Việt:\n\nCâu hỏi: "${question}"`;

                const answer = await callGemini(prompt);
                typeEffect(answerBox, answer);
            });
        });
    </script>
@endsection
