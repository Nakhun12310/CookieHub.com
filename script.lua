export default function handler(req, res) {
    res.setHeader("Content-Type", "text/plain");
    res.send(`print("Cookie Scripts Loaded!")\ngame.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 100`);
}
