@extends('layouts.user_dashboard')
@section('css')
    <style>
        .invoice-container {
            max-width: 700px;
            margin: 0 auto;
            padding: 20px;
            /* background-color: #fff;
                            border-top: 8px solid #4a4a4a;
                            border-bottom: 8px solid #4a4a4a;
                            border-left: 1px solid #ccc;
                            border-right: 1px solid #ccc;
                            color: #333; */
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: white;
            font-family: Arial, sans-serif;
        }

        @media print {
            .invoice-container {
                max-width: 800px;
                height: auto;
            }
        }

        .invoice-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .invoice-header h2 {
            font-size: 24px;
            margin: 0;
            color: #555;
        }

        .invoice-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 40px;
        }

        .invoice-info .shop-info {
            flex-grow: 1;
        }

        .invoice-info .shop-info p {
            margin: 0;
            color: #777;
        }

        .invoice-info .customer-info {
            text-align: right;
        }

        .invoice-info .customer-info p {
            margin: 0;
            color: #777;
        }

        .invoice-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
        }

        .invoice-table-shop {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 40px;
        }

        .invoice-table th {
            border-bottom: 2px solid #000;
            padding: 10px;
            text-align: center;
            color: #000;
        }

        .cricle {
            background-color: #000;
            border-radius: 50%;
            height: 10px;
            width: 10px;
        }

        .invoice-table th {
            /* background-color: #f7f7f7; */
        }

        .invoice-total {
            text-align: right;
            margin-bottom: 40px;
        }

        .total-amount {
            font-size: 20px;
            margin: 0;
            color: #555;
        }

        .thank-you {
            text-align: center;
            margin-top: 40px;
            font-style: italic;
            color: #777;
        }

        .shop p {
            font-size: 12px
        }
    </style>
@endsection
@section('dashboard-content')
    <div class="ec-shop-rightside col-lg-9 col-md-12">
        <x-invoice :order="$order" />
    </div>
@endsection
