namespace Society_8777.Interface
{
    public interface IFireBaseNotification
    {
        Task SendGuestNotificationAsync(string guestName, string flatNumber);
    }
}
