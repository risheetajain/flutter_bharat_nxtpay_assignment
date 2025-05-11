class NetworkResponse {
    final bool? status;
    final String? message;
    final dynamic data;

    NetworkResponse({
        this.status,
        this.message,
        this.data,
    });

    NetworkResponse copyWith({
        bool? status,
        String? message,
        dynamic data,
    }) => 
        NetworkResponse(
            status: status ?? this.status,
            message: message ?? this.message,
            data: data ?? this.data,
        );
}
