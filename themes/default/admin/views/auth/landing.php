<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta, title -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Bootstrap, a sleek, intuitive, and powerful mobile first front-end framework for faster and easier web development.">
    <meta name="keywords" content="HTML, CSS, JS, JavaScript, framework, bootstrap, front-end, frontend, web development">
    <meta name="author" content="WowThemesNet">
    <title><?= $title ?></title>

    <!-- Google Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:100,200,300,400,400italic,500,600,700,700,800,900italic&amp;subset=latin,greek-ext,cyrillic,latin-ext,greek,cyrillic-ext,vietnamese' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=ABeeZee:100,200,300,400,400italic,500,600,700,700,800,900italic&amp;subset=latin,greek-ext,cyrillic,latin-ext,greek,cyrillic-ext,vietnamese' rel='stylesheet' type='text/css' />

    <!-- CSS -->
    <link rel='stylesheet' href='<?= base_url() ?>assets/wdp/css/bootstrap.css' type='text/css' media='all' />
    <link rel='stylesheet' href='<?= base_url() ?>assets/wdp/css/shortcodes.css' type='text/css' media='all' />
    <link rel='stylesheet' href='<?= base_url() ?>assets/wdp/css/font-awesome.css' type='text/css' media='all' />
    <link rel='stylesheet' href='<?= base_url() ?>assets/wdp/css/animate.css' type='text/css' media='all' />
    <link rel='stylesheet' href='<?= base_url() ?>assets/wdp/style.css' type='text/css' media='all' />
    <link rel='stylesheet' href='<?= base_url() ?>assets/wdp/css/skins/green2.css' type='text/css' media='all' />

    <!-- Jquery -->
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/jquery.js'></script>

    <link rel="icon" href="<?= base_url() ?>assets/img/logo.png">

    <style type="text/css">
        #chart-container {
            width: 100%;
            height: auto;
        }
    </style>
    <script type="text/javascript" src="<?= base_url() ?>assets/AdminLTE/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="<?= base_url() ?>assets/AdminLTE/plugins/chart.js/Chart.min.js"></script>

</head>

<body>
    <div id="navigation" class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<?= base_url() ?>" style="margin-bottom:30px">
                    <img src="<?= base_url() ?>assets/img/logo1.png" alt="" width="140px;">
                </a>
            </div>
            <div class="navbar-collapse collapse pull-right" id="mainMenu">
                <ul id="menu-main-menu" class="nav navbar-nav">
                    <li><a href="#top">Beranda</a></li>
                    <li><a href="#">Login</a></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- SECTION testimonials
	================================================== -->
    <section id="testimonials" class="parallax parallax-image dark-bg" style="background-color: #000000; background-image:url(assets/img/back4.jpg);">
        <div class="wrapsection">
            <div class="overlay" style="background-color: #000000; opacity: 0.5;"></div>
            <div class="container">
                <div class="parallax-content">
                    <div class="row">
                        <div id="wowtestimonials" class="owl-carousel owl-theme">
                            <div class="item wowshtestim">
                                <div class="max80 text-center">
                                    <img src="<?= base_url('assets/img/dbd1.png') ?>" width="600px" alt=""><br />
                                </div>
                            </div><!-- /.item -->
                            <div class="item wowshtestim">
                                <div class="max80 text-center">
                                    <img src="<?= base_url('assets/img/dbd2.jpeg') ?>" width="600px" alt=""><br />
                                </div>
                            </div><!-- /.item -->
                            <div class="item wowshtestim">
                                <div class="max80 text-center">
                                    <img src="<?= base_url('assets/img/malaria1.jpeg') ?>" width="600px" alt=""><br />
                                </div>
                            </div><!-- /.item -->
                            <div class="item wowshtestim">
                                <div class="max80 text-center">
                                    <img src="<?= base_url('assets/img/malaria2.jpg') ?>" width="600px" alt=""><br />
                                </div>
                            </div><!-- /.item -->

                        </div><!-- /.wowcarouselanything -->
                    </div><!-- /.row -->
                </div><!-- .parallax-content -->
            </div><!-- /.container -->
        </div><!-- /.wrapsection -->
    </section>

    <!-- SECTION progress (counters)
	================================================== -->
    <!-- <section id="progress" class="parallax parallax-image dark-bg" style="background-color:#f86d18;"> -->
    <!-- <section id="progress" class="parallax parallax-image light-bg">

        <div class="wrapsection">

            <div class="overlay"></div>

            <div class="container">

                <div class="parallax-content">

                    <div class="row">

                        <div class="col-md-3">
                            <div class="funfacts text-center">
                                <div class="icon">
                                    <i class="fa fa-bank"></i>
                                </div>
                                <h2 class="counter" data-from="0" data-to="1" data-speed="2500"></h2>
                                <h4>Desa</h4>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="funfacts text-center">
                                <div class="icon">
                                    <i class="fa fa-home"></i>
                                </div>
                                <h2 class="counter" data-from="0" data-to="<?= $jentik_tahun->total ?>" data-speed="500"></h2>
                                <h4>Jumlah Jentik Tahun <?= date('Y') ?></h4>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="funfacts text-center">
                                <div class="icon">
                                    <i class="fa fa-users"></i>
                                </div>
                                <h2 class="counter" data-from="0" data-to="<?= $jentik_bulan->total ?>" data-speed="1500"></h2>
                                <h4>Jumlah Jentik Bulan <?= date('F') ?></h4>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="funfacts text-center">
                                <div class="icon">
                                    <i class="fa fa-user"></i>
                                </div>
                                <h2 class="counter" data-from="0" data-to="<?= $jumlah_kk ?>" data-speed="2500"></h2>
                                <h4>Jumlah Kepala Keluarga</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->

    <!-- BEGIN FOOTER
================================================== -->
    <section class="nowidgetbottom">
        <p id="back-top">
            <a href="#top"><span><i class="fa fa-chevron-up"></i></span></a>
        </p>
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    Copyright &copy; <?= date('Y') ?> - PT. Babada Wasaka Indonesia
                </div>
            </div>
        </div>
    </section>
    <!-- END FOOTER
================================================== -->

    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/bootstrap.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/easing.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/smoothscroll.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/wow.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/appear.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/fitvids.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/common.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/flexslider.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/countto.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/jquery.cycle.all.min.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/carousel.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/carousel-anything.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/carousel-testimonials.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/isotope.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/carousel-blog.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/parallax.js'></script>
    <script type='text/javascript' src='<?= base_url() ?>assets/wdp/js/validate.js'></script>
</body>

</html>