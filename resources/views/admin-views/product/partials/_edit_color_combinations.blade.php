@if (count($combinations) > 0)
    <table class="table table-bordered">
        <thead>
            <tr>
                <td class="text-center">
                    <label for="" class="control-label">{{ \App\CPU\translate('Variant') }}</label>
                </td>
                <td class="text-center">
                    <label for="" class="control-label">{{ \App\CPU\translate('Image URL') }}</label>
                </td>

            </tr>
        </thead>
        <tbody>
            @foreach ($combinations as $key => $combination)
                <tr>
                    <td>
                        <label for="" class="control-label">{{ $combination['color'] }}</label>
                        <input value="{{ $combination['color'] }}" name="color[]" style="display: none">
                    </td>
                    <td>
                        <input type="text" name="color_image[]"
                            value="{{ $combination['image'] }}" class="form-control" required>
                    </td>

                </tr>
            @endforeach
        </tbody>
    </table>
@endif
