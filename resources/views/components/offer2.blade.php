<div class="row">
    <div class="col-lg-4 ps-0 d-flex mid-bn mb-4 me-5 margin-left img-fluid"
        style="height: 275px; overflow: hidden; position: relative; background-size: cover;background-repeat: no-repeat; background-image: url('{{ Voyager::image(setting('offer.offer1Image')) }}');">

        <div class="p-4 ms-4">
            <p style="font-size: 14px">{{ setting('offer.offer1category') }}</p>
            <h4>{{ setting('offer.offer1Title') }}</h4>
            <a class="mid-btn mt-4 btn btn-dark" href="{{ setting('offer.offer1link') }}"><span
                    style="font-size: 10px">View Collections</span></a>
        </div>
    </div>


    <div class="col-lg-7 mid-bn mb-4 img-fluid"
        style="height: 275px;overflow: hidden;background-size: cover;background-image: url({{ Voyager::image(setting('offer.offer2Image')) }})">

        <div class=" p-4 ms-4">
            <p>{{ setting('offer.offer2category') }}</p>
            <h4>{{ setting('offer.offer2Title') }}</h4>
            <a class="mid-btn mt-4 btn btn-dark" href="{{ setting('offer.offer2link') }}"><span
                    style="font-size: 10px">View Collection</span></a>
        </div>


    </div>
</div>
