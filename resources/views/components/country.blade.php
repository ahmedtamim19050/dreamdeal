<select class="bg-light form-select form-control mx-0 border  @error('country') is-invalid @enderror" name="country"
    id="country" value="{{ auth()->user()->shop ? auth()->user()->shop->country : ' ' }}" required>
    <option selected>Choose Country</option>
    @if (auth()->user()->shop)
        <option {{ auth()->user()->shop->country == 'United States' ? 'selected' : '' }}>United States</option>
    @else
        <option value="United States">United States</option>
    @endif
</select>
@error('country')
    <span class="invalid-feedback" role="alert">
        <strong>{{ $message }}</strong>
    </span>
@enderror
