@extends('layouts.seller-dashboar')
@section('dashboard-content')
    <div class="ec-shop-rightside col-lg-9 col-md-12">
        <div class="ec-vendor-dashboard-card space-bottom-30">
            <div class="ec-vendor-card-header">
                <h5>Charges </h5>


            </div>

            @if ($charges->count() == !0)
                <div class="ec-vendor-card-body">

                    <div class="ec-vendor-card-table">



                        <table class="table ec-table">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Account name</th>
                                    <th scope="col">Billing Reason</th>
                                    {{-- <th scope="col">Card</th> --}}
                                   
                                    <th scope="col">Total</th>
                                    <th scope="col">Action</th>

                                </tr>
                            </thead>
                            <tbody>

                                @foreach ($charges as $charge)

                                    <tr>
                                        <th scope="row"><span>{{ $charge->id }}</span></th>
                                        <td><span>{{ $charge->account_name }}</span></td>
                                        <td><span>{{ $charge->billing_reason }}</span></td>
                                        {{-- <td><span>{{ ucwords(auth()->user()->getCard() ? auth()->user()->getCard()->card->brand : '') }} XXXX XXXX XXXX
                                                                {{auth()->user()->getCard() ? auth()->user()->getCard()->card->last4 : '' }}</span></td> --}}
                               
                                        <td><span>{{ Sohoj::price($charge->total / 100) }}</span></td>
                                        <td>
                                            <span><a href="{{ route('vendor.charge', $charge->id) }}"><i
                                                        class="fa-regular fa-eye"></i></a> </span>

                                        </td>

                                    </tr>
                                @endforeach


                            </tbody>
                        </table>

                    </div>

                </div>
            @else
                <h3 class="text-center text-danger">No Charges create</h3>
            @endif
@endsection