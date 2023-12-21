@extends('layouts.seller-dashboar')
@section('css')
@endsection
@section('dashboard-content')
    <div class="ec-shop-rightside col-lg-9 col-md-12" style="position: relative;">
        <div class="ec-vendor-dashboard-card ec-vendor-profile-card">
            @if (auth()->user()->shop)
                @if (auth()->user()->shop->status == 0)
                    <div class="card-header text-center">
                        <span style="color: red">Your shop is pending approval. We'll notify you once it's approved.</span>
                    </div>
                @endif
            @endif
            <div class="ec-vendor-card-body">


                <div class="row">
                    <div class="col-md-12">
                        <div class="ec-vendor-block-profile">
                            <img src="{{ auth()->user()->shop ? Voyager::image(auth()->user()->shop->banner) : asset('assets/img/1.jpg') }}"
                                alt=""
                                style="    height: 190px;
                                    width: 100%;"
                                class="img-fluid">
                            <a href="javascript:void(0)" class="shadow-lg"
                                style="position: absolute; top:0px; right:20px; background-color: #fff; border-radius:50%;padding:10px 0"
                                data-bs-toggle="modal" data-bs-target="#coverModal"><span class="mx-3"><i
                                        class="fi-rr-edit" style="font-size: 16px;"></i></span></a>
                            <div class="ec-vendor-block-img space-bottom-30" style="background-color: snow;">
                                <div class="ec-vendor-block-b"></div>
                                <div class="ec-vendor-block-detail">
                                    <div style="position: relative;">

                                        <img class="v-img img-fluid"
                                            src="{{ auth()->user()->shop ? Voyager::image(auth()->user()->shop->logo) : asset('assets/img/heaer.jpg') }}"
                                            alt="vendor image">
                                        <a href="javascript:void(0)" class="shadow-lg"
                                            style="position: absolute; top:-59px; right:-21px; background-color: #fff; border-radius:50%;padding:10px 0"
                                            data-bs-toggle="modal" data-bs-target="#logoModal"><span class="mx-3"><i
                                                    class="fi-rr-edit" style="font-size: 16px;"></i></span></a>
                                    </div>
                                    <h5>{{ auth()->user()->name }}</h5>
                                    <p>( {{ auth()->user()->shop ? auth()->user()->shop->name : 'no shop has been created' }}
                                        )</p>
                                </div>
                            </div>
                            <form class="row g-3 " action="{{ route('vendor.store') }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                <div class="col-md-12 mb-3">
                                    <label for="name" class="form-label">Shop Name<span
                                            class="text-danger">*</span></label>
                                    <input type="text" name="name"
                                        value="{{ auth()->user()->shop ? auth()->user()->shop->name : old('name') }}"
                                        class="form-control @error('name') is-invalid @enderror" id="name" required>
                                    @error('name')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>


                                <div class="col-12 mb-3">
                                    <div class="form-floating">
                                        <textarea required maxlength="300" class="form-control @error('short_description') is-invalid @enderror"
                                            placeholder="Short Description" name="short_description" id="short_description" style="height: 100px" required>{{ auth()->user()->shop ? auth()->user()->shop->short_description : old('short_description') }}</textarea>
                                        <label for="floatingTextarea2">Short Description<span
                                                class="text-danger">*</span></label>
                                        <span id="charCount">Characters left: 300</span>
                                        @error('short_description')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="inputEmail4" class="form-label">Email<span
                                            class="text-danger">*</span></label>
                                    <input type="email" class="form-control @error('email') is-invalid @enderror"
                                        value="{{ auth()->user() ? auth()->user()->email : ' ' }}" name="email"
                                        id="inputEmail4" required>
                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="inputEmail4" class="form-label">Phone Number<span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control @error('phone') is-invalid @enderror"
                                        value="{{ auth()->user()->shop ? auth()->user()->shop->phone : old('phone') }}"
                                        name="phone" id="phone" required>
                                    @error('phone')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                @php
                                    
                                @endphp
                                <div class="col-md-6 mb-2">
                                    <label for="inputEmail4" class="form-label">Shop Tags <span>( Type and
                                            make comma to separate tags And Use Three word to describe your shop
                                            )</span><span class="text-danger">*</span></label>
                                    <input type="text" class="form-control @error('tags') is-invalid @enderror"
                                        value="{{ auth()->user()->shop ? auth()->user()->shop->tags : old('tags') }}"
                                        data-role="tagsinput" name="tags" id="group_tag">
                                    @error('tags')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-6 mb-3 mt-4">
                                    <label for="inputEmail4" class="form-label">Company Name<span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control @error('company_name') is-invalid @enderror"
                                        value="{{ auth()->user()->shop ? auth()->user()->shop->company_name : old('company_name') }}"
                                        name="company_name" id="company_name" required>
                                    @error('company_name')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label for="inputEmail4" class="form-label">Shop Address<span
                                            class="text-danger">*</span></label>
                                    <input type="text"
                                        class="form-control @error('company_registration') is-invalid @enderror"
                                        value="{{ auth()->user()->shop ? auth()->user()->shop->company_registration : old('company_registration') }}"
                                        name="company_registration" id="company_registration" required>
                                    @error('company_registration')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="col-md-6 mb-3">
                                    <label for="inputCity" class="form-label">Country<span
                                            class="text-danger">*</span></label>
                                    <x-country />
                                </div>

                                <div class="col-md-5 mb-3">
                                    <label for="inputState" class="form-label">State<span
                                            class="text-danger">*</span></label>
                                    <x-state />
                                    @error('state')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="inputCity" class="form-label">City<span
                                            class="text-danger">*</span></label>
                                    <input type="text" class="form-control @error('city') is-invalid @enderror"
                                        value="{{ auth()->user()->shop ? auth()->user()->shop->city : old('city') }}"
                                        name="city" id="city" required>
                                    @error('city')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                                <div class="col-md-3 mb-3">
                                    <label for="inputZip" class="form-label">Zip</label>
                                    <input type="text"
                                        class="form-control p-2 @error('post_code') is-invalid @enderror"
                                        value="{{ auth()->user()->shop ? auth()->user()->shop->post_code : old('post_code') }}"
                                        name="post_code" id="post_code" required>
                                    @error('post_code')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>

                                <div class="col-12 mb-3">
                                    <label for="inputAddress2" class="form-label">About Shop<span
                                            class="text-danger">*</span></label>
                                    <textarea id="description" required maxlength="1000" name="description" cols="20" rows="10" required>{{ auth()->user()->shop ? auth()->user()->shop->description : old('description') }}</textarea>
                                    <span id="descriptionCharCount">Characters left: 1000</span>
                                </div>
                                <div class="col-12 mt-3 d-flex justify-content-end">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="ec-vendor-block-profile">
                            <h4 class="mb-3">Shop Social Links</h4>
                            <form action="{{ route('vendor.shopSocialLinksStore.store') }}" method="POST"
                                enctype="multipart/form-data">
                                @csrf
                                <div class="row ">
                                    <div class="col-md-6">
                                        <label for="title" class="form-label">Facebook</label>
                                        <input type="text" name="meta[facebook]"
                                            value="{{ auth()->user()->shop ? auth()->user()->shop->facebook : old('facebook') }}"
                                            class="form-control @error('meta') is-invalid @enderror" id="title">
                                        @error('meta.*.facebook')
                                            <p>
                                                {{ $message }}
                                            </p>
                                        @enderror
                                    </div>
                                    <div class="col-md-6">
                                        <label for="title2" class="form-label">Linkedin</label>
                                        <input type="text" name="meta[linkedin]"
                                            value="{{ auth()->user()->shop ? auth()->user()->shop->linkedin : old('linkedin') }}"
                                            class="form-control @error('meta') is-invalid @enderror" id="title2">
                                        @error('meta.*.linkedin')
                                            <p>
                                                {{ $message }}
                                            </p>
                                        @enderror
                                    </div>
                                    <div class="col-md-6">
                                        <label for="title3" class="form-label">Instagram</label>
                                        <input type="text" name="meta[instagram]"
                                            value="{{ auth()->user()->shop ? auth()->user()->shop->instagram : old('instagram') }}"
                                            class="form-control @error('meta') is-invalid @enderror" id="title3">
                                        @error('meta.*.instagram')
                                            <p>
                                                {{ $message }}
                                            </p>
                                        @enderror
                                    </div>
                                    <div class="col-md-6">
                                        <label for="title4" class="form-label">Twitter</label>
                                        <input type="text" name="meta[twitter]"
                                            value="{{ auth()->user()->shop ? auth()->user()->shop->twitter : old('twitter') }}"
                                            class="form-control @error('meta') is-invalid @enderror" id="title4">
                                        @error('meta.*.twitter')
                                            <p>
                                                {{ $message }}
                                            </p>
                                        @enderror
                                    </div>

                                </div>

                                <button type="submit" class="btn btn-dark mt-3">Save</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const textarea = document.getElementById('short_description');
        const charCount = document.getElementById('charCount');

        textarea.addEventListener('input', function() {
            const maxLength = 300;
            const currentLength = textarea.value.length;

            if (currentLength > maxLength) {
                textarea.value = textarea.value.slice(0, maxLength);
            }

            charCount.textContent = `Characters left: ${maxLength - currentLength}`;
        });

        const description = document.getElementById('description');
        const descriptionCharCount = document.getElementById('descriptionCharCount');

        description.addEventListener('input', function() {
            const maxLength = 1000;
            const currentLength = description.value.length;

            if (currentLength > maxLength) {
                description.value = descriptionCharCount.value.slice(0, maxLength);
            }

            descriptionCharCount.textContent = `Characters left: ${maxLength - currentLength}`;
        });
    </script>


@endsection
