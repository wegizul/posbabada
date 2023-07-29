<?= $error = '';
$message = ''; ?>
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

    <!-- <link rel="shortcut icon" href="<?= $assets ?>images/icon.png" /> -->
    <link rel="icon" href="<?= base_url('themes/default/admin/assets/') ?>images/icon.png">

    <style type="text/css">
        #chart-container {
            width: 100%;
            height: auto;
        }
    </style>

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
                    <img src="<?= base_url() ?>assets/uploads/logos/logo.png" alt="" width="140px;">
                </a>
            </div>
            <div class="navbar-collapse collapse pull-right" id="mainMenu">
                <ul id="menu-main-menu" class="nav navbar-nav">
                    <li><a href="<?= base_url() ?>">Beranda</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-sign-in"></i> Login
                        </a>
                        <ul class="dropdown-menu pull-right">
                            <?php
                            if ($error) {
                            ?>
                                <div class="alert alert-danger">
                                    <button data-dismiss="alert" class="close" type="button">×</button>
                                    <ul class="list-group"><?= $error; ?></ul>
                                </div>
                            <?php
                            }
                            if ($message) {
                            ?>
                                <div class="alert alert-success">
                                    <button data-dismiss="alert" class="close" type="button">×</button>
                                    <ul class="list-group"><?= $message; ?></ul>
                                </div>
                            <?php
                            }
                            ?>
                            <?php echo admin_form_open('auth/login', 'class="login" data-toggle="validator"'); ?>
                            <div class="col-sm-12">
                                <div class="textbox-wrap form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" required="required" class="form-control" name="identity" placeholder="<?= lang('username') ?>" />
                                    </div>
                                </div>
                                <div class="textbox-wrap form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                        <input type="password" required="required" class="form-control " name="password" placeholder="<?= lang('pw') ?>" />
                                    </div>
                                </div>
                            </div>
                            <div class="form-action col-sm-12">
                                <button type="submit" class="btn btn-success pull-right" style="margin-top: 0px;"><?= lang('login') ?> &nbsp; <i class="fa fa-sign-in"></i></button>
                            </div>
                            <?php echo form_close(); ?>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>

    <!-- SECTION testimonials
	================================================== -->
    <section id="testimonials" class="parallax parallax-image dark-bg" style="background-color: #000000; background-image:url(<?= base_url() ?>assets/uploads/promo/back1.JPG);">
        <div class="wrapsection">
            <div class="overlay" style="background-color: #000000; opacity: 0.7;"></div>
            <div class="container">
                <div class="parallax-content">
                    <div class="row">
                        <div id="wowtestimonials" class="owl-carousel owl-theme">
                            <div class="item wowshtestim">
                                <div class="max80 text-center">
                                    <img src="<?= base_url('assets/uploads/promo/promo3.jpeg') ?>" width="600px" alt=""><br />
                                </div>
                            </div>
                            <div class="item wowshtestim">
                                <div class="max80 text-center">
                                    <img src="<?= base_url('assets/uploads/promo/promo2.jpg') ?>" width="600px" alt=""><br />
                                </div>
                            </div>
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