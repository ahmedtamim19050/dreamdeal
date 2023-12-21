@extends('layouts.seller-dashboar')
@section('dashboard-content')
<style>
    .btn-danger {
        color: #fff;
        background-color: #dc3545;
        border-color: #dc3545;
    }

    .btn-danger:hover {
        color: #fff;
        background-color: #c12d3c;
        border-color: #c12d3c;
    }
</style>

<div class="ec-shop-rightside col-lg-9 col-md-12">
    <div class="ec-vendor-dashboard-card ec-vendor-profile-card">
        <div class="ec-vendor-card-body">


            <div class="row">
                <div class="col-md-12">
                    <div class="ec-vendor-block-profile">
                        <img src="{{ auth()->user()->shop ? Voyager::image(auth()->user()->shop->banner) : asset('assets/img/1.jpg') }}" alt="" style="    height: 190px;
                                    width: 100%;
                                    object-fit: cover;">
                        <div class="ec-vendor-block-img space-bottom-30" style="background-color: snow;">
                            <div class="ec-vendor-block-b"></div>
                            <div class="ec-vendor-block-detail">
                                <img class="v-img" src="{{ auth()->user()->shop ? Voyager::image(auth()->user()->shop->logo) : asset('assets/img/heaer.jpg') }}" style="object-fit: cover;" alt="vendor image">
                                <h5>{{ auth()->user()->name }}</h5>
                                <p>( {{ auth()->user()->shop ? auth()->user()->shop->name : 'no shop has been created' }}
                                    )</p>
                            </div>
                        </div>
                        @if( setting('site.shop_settings_info'))
                        <div class="card shadow">
                            <div class="card-body">
                                {!! setting('site.shop_settings_info') !!}
                            </div>
                        </div>
                        @endif
                        <h3 class="mt-3 mb-3 text-center">General Info</h3>
                        <div class="pb-3" style="border-bottom: 1px solid #E1E1E1;">
                            <form method="POST" action="{{ route('vendor.generalInfo.update') }}">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6 my-2">
                                        <div class="form-group">
                                            <label for="ein">EIN(Employer Identification Number)</label>

                                            <input type="text" class="form-control @error('tax_no') is-invalid @enderror" value="{{ auth()->user()->verification->tax_no }}" id="tax_no" placeholder="Employer Identification Number" name="tax_no">
                                            @error('tax_no')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 my-2">
                                    <div class="form-group d-flex justify-content-end">
                                        <button class="btn btn-dark btn-lg" type="submit">Update</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <h3 class="mt-3 mb-3 text-center">Bank Information Edit</h3>
                        <div class="pb-3" style="border-bottom: 1px solid #E1E1E1;">
                            <form method="POST" action="{{ route('vendor.bankInfo.update') }}">
                                @csrf
                                <div class="row">

                            
                                    <div class="col-md-6 my-2">
                                        <div class="form-group">
                                            <label for="ein">Paypal Email</label>
                                            <input type="text" class="form-control @error('paypal_email') is-invalid @enderror" id="paypal_email" value="{{ auth()->user()->verification->paypal_email }}" placeholder="Paypal email for payouts" name="paypal_email">
                                            @error('paypal_email')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>

                          
                                </div>

                                <div class="col-md-12 my-2">
                                    <div class="form-group d-flex justify-content-end">
                                        <button class="btn btn-dark btn-lg" type="submit">Update</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <h3 class="mt-3 mb-3 text-center">Address Edit</h3>
                        <div class="pb-3" style="border-bottom: 1px solid #E1E1E1;">
                            <form method="POST" action="{{ route('vendor.shopAddress.update') }}">
                                @csrf
                                <div class="row">
                                    <div class="col-md-6 my-2">
                                        <div class="form-group">
                                            <label for="address">Street address<span class="text-danger">*</span></label>
                                            <textarea id="address" placeholder="Address" class="form-control mb-3 bg-light @error('address_1') is-invalid @enderror" name="address_1" required>{{ auth()->user()->shopAddress ? auth()->user()->shopAddress->address_1 : '' }}</textarea>

                                            @error('address_1')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6 my-2">
                                        <div class="form-group">
                                            <label for="ein">City</label>
                                            <input type="text" value="{{ auth()->user()->shopAddress ? auth()->user()->shopAddress->city : '' }}" class="form-control @error('city') is-invalid @enderror" id="city" placeholder="City" name="city">
                                            @error('city')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>


                                    <div class="col-md-6 my-2">
                                        <div class="form-group">
                                            <label for="ein">State</label>
                                            @php
                                            $states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'];
                                            @endphp

                                            <select id="inputState" class="bg-light form-select form-control mx-0 border @error('state') is-invalid @enderror" value="{{ auth()->user()->shopAddress ? auth()->user()->shopAddress->state : ' ' }}" name="state" id="state" required>
                                                <option selected>Choose State</option>

                                                @foreach ($states as $state)
                                                @if (auth()->user()->shopAddress)
                                                <option value="{{ $state }}" {{ auth()->user()->shopAddress->state == $state ? 'selected' : '' }}>
                                                    {{ $state }}
                                                </option>
                                                @else
                                                <option value="{{ $state }}">
                                                    {{ $state }}
                                                </option>
                                                @endif
                                                @endforeach


                                            </select>
                                            @error('state')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6 my-2">
                                        <div class="form-group">
                                            <label for="ein">Country</label>
                                            <select class="bg-light form-select form-control mx-0 border  @error('country') is-invalid @enderror" name="country" id="country" value="{{ auth()->user()->shopAddress ? auth()->user()->shopAddress->country : ' ' }}" required>
                                                <option selected>Choose Country</option>
                                                @if (auth()->user()->shopAddress)
                                                <option {{ auth()->user()->shopAddress->country == 'United States' ? 'selected' : '' }}>
                                                    United States</option>
                                                @else
                                                <option value="United States">United States</option>
                                                @endif
                                            </select>
                                            @error('country')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                            @enderror

                                        </div>
                                    </div>


                                </div>

                                <div class="col-md-12 my-2">
                                    <div class="form-group d-flex justify-content-end">
                                        <button class="btn btn-dark btn-lg" type="submit">Update</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="mt-5" style="border-bottom: 1px solid #b5b5b5; "></div>
                        <div class="row mt-5">
                            <div class="col-md-12">
                                <div class="ec-vendor-block-profile">
                                    <h4 class="mb-3">Shop Menu bar</h4>
                                    <form class="  " action="{{ route('vendor.shopMenuStore.store') }}" method="POST" enctype="multipart/form-data">
                                        @csrf
                                        <div class="row ">



                                            <div class="col-md-6">
                                                <label for="title" class="form-label ">Menu Title 1</label>
                                                <input type="text" name="meta[menuTitle1]" value="{{ auth()->user()->shop->menuTitle1 }}" class="form-control @error('meta') is-invalid @enderror" id="menuTitle1">
                                                @error('meta[menuTitle1]')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                                @enderror

                                            </div>
                                            <div class="col-md-6">
                                                <label for="title" class="form-label">Menu Link 1</label>
                                                <input type="text" name="meta[menuLink1]" value="{{ auth()->user()->shop->menuLink1 }}" class="form-control @error('meta') is-invalid @enderror" id="menuLink1">
                                                @error('meta[menuLink1]')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                                @enderror
                                            </div>
                                            <div class="col-md-6 mt-2">
                                                <label for="title" class="form-label ">Menu Title 2</label>
                                                <input type="text" name="meta[menuTitle2]" value="{{ auth()->user()->shop->menuTitle2 }}" class="form-control @error('meta') is-invalid @enderror" id="menuTitle2">
                                                @error('meta[menuTitle2]')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                                @enderror

                                            </div>
                                            <div class="col-md-6 mt-2">
                                                <label for="title" class="form-label">Menu Link 2</label>
                                                <input type="text" name="meta[menuLink2]" value="{{ auth()->user()->shop->menuLink2 }}" class="form-control @error('meta') is-invalid @enderror" id="menuLink2">
                                                @error('meta[menuLink2]')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                                @enderror
                                            </div>
                                        </div>

                                        <div class="form-group d-flex justify-content-end">
                                            <button class="btn btn-dark btn-lg mt-3" type="submit"> Save</button>
                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                        <h3 class="mt-3 mb-3 text-center">Change Password</h3>
                        <form method="POST" action="{{ route('vendor.ChangePassword') }}">
                            @csrf
                            <div class="row">
                                <div class="col-md-6 my-2">
                                    <div class="form-group">

                                        <input type="password" class="form-control @error('current_password') is-invalid @enderror" id="current_password" placeholder="current password" name="current_password">
                                        @error('current_password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6 my-2">
                                    <div class="form-group">

                                        <input type="password" class="form-control @error('new_password') is-invalid @enderror" id="new_password" placeholder="new password" name="new_password">
                                        @error('new_password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>

                            </form>
                    
                            <div class="col-md-12 my-2">
                                <div class="form-group">

                                    <input type="password" class="form-control @error('new_confirm_password') is-invalid @enderror" id="new_confirm_password" placeholder="Confirm password" name="new_confirm_password">
                                    @error('new_confirm_password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12 my-2">
                                <div class="form-group d-flex justify-content-end">
                                    <button class="btn btn-dark btn-lg" type="submit"> Change Password</button>
                                </div>
                            </div>

                        </form>
                  
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection